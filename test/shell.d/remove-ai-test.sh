#!/bin/bash

set -euo pipefail

source "$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/base-test.sh"

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

mkdir -p "$tmp_dir/bin"

cat >"$tmp_dir/bin/collie-pkg-drop" <<'SCRIPT'
#!/bin/bash
printf 'drop:%s\n' "$*" >>"$TEST_LOG"
SCRIPT
chmod +x "$tmp_dir/bin/collie-pkg-drop"

# collie-remove-ai-claude quits the running app before deleting its state;
# a real pkill here would take the developer's own Claude with it.
cat >"$tmp_dir/bin/pkill" <<'SCRIPT'
#!/bin/bash
printf 'pkill:%s\n' "$*" >>"$TEST_LOG"
SCRIPT
chmod +x "$tmp_dir/bin/pkill"

# collie-remove-ai-perplexity asks through gum whether the user's data goes
# too. The stub answers "no" unless a test says otherwise and logs the call: a
# real gum would hang the run, and one that answered "yes" on its own would be
# the data loss the default-no exists to prevent. It logs to its own file
# reached, and the pty runs here call it on purpose.
cat >"$tmp_dir/bin/gum" <<'SCRIPT'
#!/bin/bash
printf 'gum:%s\n' "$*" >>"$TEST_GUM_LOG"
exit "${TEST_GUM_STATUS:-1}"
SCRIPT
chmod +x "$tmp_dir/bin/gum"

export TEST_GUM_LOG="$tmp_dir/gum-log"
touch "$TEST_GUM_LOG"

export TEST_LOG="$tmp_dir/log"
export PATH="$tmp_dir/bin:$PATH"

fresh_home() {
  rm -rf "$tmp_dir/home"
  mkdir -p "$tmp_dir/home"
  export HOME="$tmp_dir/home"
}

# The Codex CLI ships in its own package and resolves its runtime out of
# ~/.cache/codex-runtimes, so removing the desktop app must not take it.
fresh_home
mkdir -p "$HOME/.config/Codex" "$HOME/.cache/Codex" "$HOME/.cache/codex-runtimes/codex-primary-runtime" "$HOME/.codex"
"$ROOT/bin/collie-remove-ai-chatgpt" >/dev/null

[[ ! -e $HOME/.config/Codex ]] || fail "ChatGPT removal deletes the desktop app's config"
pass "ChatGPT removal deletes the desktop app's config"

[[ -d $HOME/.cache/codex-runtimes/codex-primary-runtime ]] || fail "ChatGPT removal keeps the Codex CLI's runtime cache"
pass "ChatGPT removal keeps the Codex CLI's runtime cache"

[[ -d $HOME/.codex ]] || fail "ChatGPT removal keeps the Codex CLI's config"
pass "ChatGPT removal keeps the Codex CLI's config"

# The Claude Code CLI ships in its own package and keeps its state in
# ~/.claude, ~/.claude.json, and ~/.cache/claude-cli-nodejs, so removing the
# desktop app must not take it.
fresh_home
mkdir -p "$HOME/.config/Claude" "$HOME/.cache/Claude" "$HOME/.cache/claude-cli-nodejs" "$HOME/.claude"
touch "$HOME/.claude.json"
"$ROOT/bin/collie-remove-ai-claude" >/dev/null

for gone in .config/Claude .cache/Claude; do
  [[ ! -e $HOME/$gone ]] || fail "Claude removal deletes the desktop app's config and caches" "$gone"
done
pass "Claude removal deletes the desktop app's config and caches"

for kept in .claude .claude.json .cache/claude-cli-nodejs; do
  [[ -e $HOME/$kept ]] || fail "Claude removal keeps the Claude Code CLI's state" "$kept"
done
pass "Claude removal keeps the Claude Code CLI's state"

grep -qx 'pkill:-x claude-desktop' "$TEST_LOG" || fail "Claude removal quits the running app before deleting its state"
pass "Claude removal quits the running app before deleting its state"

# LM Studio's models follow a relocatable home, named only by the pointer file.
fresh_home
mkdir -p "$tmp_dir/relocated-models/models"
printf '%s' "$tmp_dir/relocated-models" >"$HOME/.lmstudio-home-pointer"
mkdir -p "$HOME/.config/LM Studio"
"$ROOT/bin/collie-remove-ai-lm-studio" >/dev/null

[[ ! -e $tmp_dir/relocated-models ]] || fail "LM Studio removal follows a relocated home pointer"
pass "LM Studio removal follows a relocated home pointer"

[[ ! -e "$HOME/.config/LM Studio" ]] || fail "LM Studio removal deletes its config"
pass "LM Studio removal deletes its config"

# A pointer that resolves to the home directory itself would take everything.
fresh_home
printf '%s' "$HOME" >"$HOME/.lmstudio-home-pointer"
mkdir -p "$HOME/Documents"
"$ROOT/bin/collie-remove-ai-lm-studio" >/dev/null

[[ -d $HOME/Documents ]] || fail "LM Studio removal refuses a pointer aimed at the home directory"
pass "LM Studio removal refuses a pointer aimed at the home directory"

# Perplexity's other products (the CLI, Comet) share the perplexity-* prefix;
# the desktop app owns only its rpc-server runtime and Electron caches. The
# logins, vault, and flags are the user's and only go when a terminal said so.
seed_perplexity() {
  fresh_home
  mkdir -p "$HOME/.config/Perplexity" "$HOME/.cache/Perplexity" \
    "$HOME/.cache/perplexity-rpc-server" "$HOME/.local/share/perplexity-rpc-server" \
    "$HOME/.local/state/perplexity" "$HOME/.cache/perplexity-personal-computer-poc"
  touch "$HOME/.config/perplexity-flags.conf"
}

# </dev/null pins stdin off a terminal, so this run exercises the
# non-interactive path no matter where the suite itself is running.
seed_perplexity
"$ROOT/bin/collie-remove-ai-perplexity" </dev/null >/dev/null

for gone in .cache/Perplexity .cache/perplexity-rpc-server .local/share/perplexity-rpc-server; do
  [[ ! -e $HOME/$gone ]] || fail "Perplexity removal deletes the app's runtime and caches" "$gone"
done
pass "Perplexity removal deletes the app's runtime and caches"

for kept in .config/Perplexity .local/state/perplexity .config/perplexity-flags.conf .cache/perplexity-personal-computer-poc; do
  [[ -e $HOME/$kept ]] || fail "Perplexity removal keeps the user's data and other products' caches" "$kept"
done
pass "Perplexity removal keeps the user's data and other products' caches"

grep -qx 'drop:perplexity' "$TEST_LOG" || fail "Perplexity removal drops the perplexity package"
pass "Perplexity removal drops the perplexity package"

# Without a terminal there is nobody to ask, so gum must not even be reached:
# one that answered "yes" on its own would be a data loss.
! grep -q '^gum:' "$TEST_GUM_LOG" || fail "Perplexity removal keeps the user's data unasked when there is no terminal"
pass "Perplexity removal keeps the user's data unasked when there is no terminal"

# script(1) puts the remover on a pty, the only way -t 0 answers true in a
# test; the stubbed gum then supplies the answer.
seed_perplexity
script -qec "'$ROOT/bin/collie-remove-ai-perplexity'" /dev/null >/dev/null 2>&1

[[ -d $HOME/.config/Perplexity && -d $HOME/.local/state/perplexity && -f $HOME/.config/perplexity-flags.conf ]] ||
  fail "Perplexity removal keeps the user's data when the answer is no"
pass "Perplexity removal keeps the user's data when the answer is no"

# The stub answers "no" on its own, so only the logged arguments prove the
# real gum would not default to yes on a bare Enter.
grep -q '^gum:confirm --default=false ' "$TEST_GUM_LOG" ||
  fail "Perplexity removal asks with the destructive answer defaulted off"
pass "Perplexity removal asks with the destructive answer defaulted off"

# A partial install has no user data to measure; du failing must not abort
# the removal between the package and the prompt.
seed_perplexity
rm -rf "$HOME/.config/Perplexity" "$HOME/.local/state/perplexity"
script -qec "'$ROOT/bin/collie-remove-ai-perplexity'" /dev/null >/dev/null 2>&1 ||
  fail "Perplexity removal survives user-data directories that are already gone"
pass "Perplexity removal survives user-data directories that are already gone"

# gum draws its prompt on stderr; with stderr redirected the question would be
# invisible, so the remover must keep the data instead of blocking on it.
seed_perplexity
gum_calls_before=$(wc -l <"$TEST_GUM_LOG")
script -qec "'$ROOT/bin/collie-remove-ai-perplexity' 2>/dev/null" /dev/null >/dev/null 2>&1 ||
  fail "Perplexity removal completes when stderr is not a terminal"
[[ -d $HOME/.config/Perplexity ]] && (( $(wc -l <"$TEST_GUM_LOG") == gum_calls_before )) ||
  fail "Perplexity removal keeps the user's data unasked when stderr is not a terminal"
pass "Perplexity removal keeps the user's data unasked when stderr is not a terminal"

seed_perplexity
TEST_GUM_STATUS=0 script -qec "'$ROOT/bin/collie-remove-ai-perplexity'" /dev/null >/dev/null 2>&1

for gone in .config/Perplexity .local/state/perplexity .config/perplexity-flags.conf; do
  [[ ! -e $HOME/$gone ]] || fail "Perplexity removal deletes the user's data on an explicit yes" "$gone"
done
pass "Perplexity removal deletes the user's data on an explicit yes"

# Without HOME the rm -rf paths would degrade to /-rooted ones; -u makes that a
# refusal instead.
if env -u HOME "$ROOT/bin/collie-remove-ai-perplexity" </dev/null >/dev/null 2>&1; then
  fail "Perplexity removal refuses to run without HOME"
fi
pass "Perplexity removal refuses to run without HOME"

# ~/.grok belongs to the Grok CLI that collie-default-agent installs.
fresh_home
mkdir -p "$HOME/.config/Grok Bot" "$HOME/.grokbot" "$HOME/.grok"
"$ROOT/bin/collie-remove-ai-grok-bot" >/dev/null

[[ ! -e $HOME/.grokbot ]] || fail "Grok Bot removal deletes its own data"
pass "Grok Bot removal deletes its own data"

[[ -d $HOME/.grok ]] || fail "Grok Bot removal keeps the Grok CLI's state"
pass "Grok Bot removal keeps the Grok CLI's state"

# Every acceleration variant depends on the base package, so package presence is
# the test the remover can actually act on; the command alone is also provided by
# builds collie-pkg-drop will not touch.
ollama_row=$(grep '^  "remove.ai.ollama":' "$ROOT/default/collie/collie-menu.jsonc")
[[ $ollama_row == *'"when":"collie-pkg-present ollama"'* ]] ||
  fail "Ollama removal is offered only where the package is installed" "$ollama_row"
pass "Ollama removal is offered only where the package is installed"
