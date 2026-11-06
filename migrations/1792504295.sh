echo "Build the lazy shims for the newly declared default coding agents"

# The settings package ships the declarations for Qwen Code, DeepSeek Harness,
# MiniMax Code, Kiro CLI, Freebuff, Kilo, Devin CLI, Amp, and Command Code.
# Until it has, stay pending so the shims are built once they arrive.
if ! collie-mise-default-tools list | grep -qxF qwen; then
  echo "Waiting for the omarchy-settings package that declares the new coding agents" >&2
  exit 1
fi

# A user who removed the preinstalls skips Collie's declarations, so there is
# nothing to build for them.
if collie-mise-default-tools declares qwen; then
  mise reshim --system
fi
