#!/usr/bin/env bash
# install.sh: run once on each new device
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
mkdir -p ~/.claude/skills

# autocrlf=true checks plugin scripts out as CRLF, which breaks their shebangs
git config --global core.autocrlf input

# Keep a real (non-symlink) settings.json once, then link ours over it
if [ -f ~/.claude/settings.json ] && [ ! -L ~/.claude/settings.json ]; then
  mv ~/.claude/settings.json ~/.claude/settings.json.bak
fi
ln -sf "$PWD/settings.json" ~/.claude/settings.json

# Link each skill individually so other entries in ~/.claude/skills survive
for skill in skills/*/; do
  [ -d "$skill" ] && ln -sfn "$PWD/${skill%/}" ~/.claude/skills/
done
