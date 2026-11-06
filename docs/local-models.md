# Local models

Local models run open models on the machine for the coding agents. The work happens in the `collie-local-ai` package, built from [omacom/collie-local-ai](https://github.com/omacom/collie-local-ai): its engine, the curated recipe catalog it reads from its own install directory, and their reference (`docs/engine.md` there, `/usr/share/doc/collie-local-ai/` once installed). It is a base package, so the panel can tell on every machine whether a recipe fits; Podman and crun, which run the models, are only optional dependencies, installed the first time a model is set up, with nvidia-container-toolkit on an NVIDIA machine for the CDI spec that hands the GPU to the containers. A recipe or engine change is a GitHub release of that repository, which the omarchy-pkgs recipe follows and builds from its tag.

## What stays in Collie

| Path | Role |
|---|---|
| `bin/collie-agent-local` | The routed command (`collie agent local <command>`). Runs `collie-local-ai`; `use` installs Podman and crun, plus nvidia-container-toolkit where `collie-hw-nvidia` finds a GPU, with `collie-pkg-add` first when they're missing |
| `shell/plugins/agents/Main.qml` | Watches the engine's `status.json` (`localModel`) and `list.json` (`localRecipes`) |
| `shell/plugins/agents/Panel.qml` | Model lines (play/pause, terminal, memory meter, loading, stopping and removing bars, errors, Delete to remove) and Add another › Local AI, offered only when `list.json` has a recipe that fits this machine, and greyed out once every fitting recipe is set up |
| `bin/collie-agent` | `--local` and `--local-model <recipe>` ask `collie-agent-local overlay` for the agent's launch overlay; `--prefer-local` does so only while a model is running (the Quake console seeds with it), and otherwise launches the usual agent |
| `shell/plugins/agents/Panel.qml` (Add another) | Runs `collie-agent-local refresh --quiet` whenever the picker shows, so Local AI lists what an upgraded package brought |
| `install/collie-base.packages`, `migrations/1793563475.sh` | Install `collie-local-ai` on every machine |
| `https://omarchy.org/manual/` | The user-facing guide |

## The contract with the package

The panel reads two files under `~/.local/state/collie/agent-local/`, written atomically by the engine:

- `status.json`: `{models: {<recipe>: {...}}, last, ram_total_gib, best}`. Each model has `unit` (`active`, `activating`, `inactive`, `failed`, `deactivating` or `removing`), `since_ms`, `expected_load_seconds`, `expected_stop_seconds`, `expected_remove_seconds`, `fits`, `error`, `vendor`, `observed` and its endpoint. `Main.qml` keeps the last valid copy and accepts only those unit states.
- `list.json`: the recipes as this machine sees them, with `available`, `installed`, `best`, `vendor`, `architecture`, and the measured `memory_gib`, `context` and `decode_tok_s` the Local AI cards show.

The panel acts only through `collie-agent-local`: `start <recipe>`, `stop <recipe>`, `remove <recipe>`, `status --write` (when a model shows as not fitting on open) and `use <recipe>` in a floating terminal. The engine's units call `collie-agent-local status --write` from their start and stop hooks.
