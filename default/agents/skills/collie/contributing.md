# Reporting Issues and Submitting PRs

Read this when the user wants to report an Collie bug, suggest a feature, or
contribute a fix upstream.

Collie lives at https://github.com/embeputer/collie. Route requests to the
right place:

- **Verified bugs** -> GitHub issues. Issues are for validated bugs only, not
  support requests.
- **Feature ideas and suggestions** ->
  https://github.com/omacom/omarchy/discussions/categories/suggestions
- **Support and "is this a bug?" questions** -> the Discord community at
  https://omarchy.org/discord. Start here when the problem isn't clearly a bug
  in Collie itself.

## Filing a Good Bug Report

The bug template asks for system details (CPU, GPU, Collie version), a
description with steps to reproduce, and diagnostics. Gather them:

```bash
collie version

# Generate the diagnostic log (also written to /tmp/collie-debug.log)
collie debug --no-sudo --print

# Interactive variant: `collie debug` offers to upload the log to
# logs.omarchy.org (expires after 24h) and prints a shareable URL to
# include in the issue.
```

**Capture the problem on screen.** A screenshot or short recording of the bug
is often worth more than the description — see [`capture.md`](capture.md) for
`collie capture screenshot` and `collie screenrecord`. Keep recordings short
and focused on the misbehavior. GitHub issue attachments are added by
drag-and-drop in the web form, so save the capture and hand the user the file
path to attach (`gh` cannot upload media).

For screen-recording failures specifically, rerun with
`COLLIE_SCREENRECORD_DEBUG=true` and attach `$XDG_RUNTIME_DIR/collie-screenrecord.log` (or `${XDG_STATE_HOME:-$HOME/.local/state}/collie/collie-screenrecord.log` without a session runtime directory).

File the issue with `gh` when available:

```bash
gh issue create --repo embeputer/collie --title "..." --body "..."
```

Include: what happened, what was expected, steps to reproduce, system details,
the debug log URL (or attached log), and the capture.

## Submitting a PR

Never develop against `/usr/share/collie`. Clone a working copy instead:

```bash
gh repo fork embeputer/collie --clone
cd collie
```

Follow the repository's own `AGENTS.md` for style, testing, and commit
conventions — it is the authority on contributions. Keep commits atomic, run
`./test/all` before pushing, and open the PR with `gh pr create`. A PR that
fixes a visual problem should include before/after captures (again, see
[`capture.md`](capture.md)).
