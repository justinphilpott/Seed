#!/bin/bash
# Dev container setup for seed
# Symlinks VS Code extensions cache and preserves Claude Code conversations.
#
# HOST_WORKSPACE is set via containerEnv in devcontainer.json
# and resolved from ${localWorkspaceFolder} at container creation time.

# Symlink cached extensions into the path VS Code expects
ln -sfn /home/vscode/.vscode-extensions-cache /home/vscode/.vscode-server/extensions
[ -f /home/vscode/.vscode-extensions-cache/extensions.json ] || echo '[]' > /home/vscode/.vscode-extensions-cache/extensions.json

# Claude Code — symlink host project state for chat continuity
HOST_KEY=$(echo "$HOST_WORKSPACE" | tr '/' '-')
CONTAINER_KEY=$(pwd | tr '/' '-')

if [ -d "$HOME/.claude" ]; then
  mkdir -p "$HOME/.claude/projects/$HOST_KEY"
  ln -sfn "$HOME/.claude/projects/$HOST_KEY" "$HOME/.claude/projects/$CONTAINER_KEY"
fi
