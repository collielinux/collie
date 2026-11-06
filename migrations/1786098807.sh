echo "Relink agent skill symlinks to default/agents/skills/collie"

mkdir -p ~/.agents/skills ~/.claude/skills ~/.codex/skills ~/.pi/agent/skills
ln -sfn "$COLLIE_PATH/default/agents/skills/collie" ~/.agents/skills/collie
ln -sfn "$COLLIE_PATH/default/agents/skills/collie" ~/.claude/skills/collie
ln -sfn "$COLLIE_PATH/default/agents/skills/collie" ~/.codex/skills/collie
ln -sfn "$COLLIE_PATH/default/agents/skills/collie" ~/.pi/agent/skills/collie
