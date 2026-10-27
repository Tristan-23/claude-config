# claude-config

My Claude Code setup, versioned so every machine gets the same plugins and skills.

## Install

```bash
git clone https://github.com/Tristan-23/claude-config
cd claude-config
./install.sh
```

Start Claude Code afterwards. If a plugin isn't installed automatically, run `/plugin install <name>@<marketplace>`.

Update with `git pull`. The symlinks pick up changes right away.

## Adding things

- **A plugin with a marketplace:** add the marketplace to `extraKnownMarketplaces` and `<plugin>@<marketplace>: true` to `enabledPlugins`. Plugins from `claude-plugins-official` only need the `enabledPlugins` entry.
- **A plain skill:** add a folder with a `SKILL.md` to `skills/`, then run `./install.sh` again to link it.

## Scanning skills

The `skill-inspector` skill in `.claude/skills/` only loads when Claude Code is opened in this repo. It isn't installed on other machines. Ask it whether a skill is safe to add, and it runs [NVIDIA SkillSpector](https://github.com/NVIDIA/skillspector) and reviews the source.

SkillSpector runs in Docker through `bin/skillspector`, which builds the image the first time it runs:

```bash
bin/skillspector scan skills/ --no-llm
```

Only the current folder and `/tmp` are mounted into the container, so pass paths relative to the repo or under `/tmp`.