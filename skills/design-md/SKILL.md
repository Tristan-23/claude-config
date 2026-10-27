---
name: design-md
description: Add a brand's DESIGN.md (from VoltAgent/awesome-design-md) to the current project so UI work follows that design language. Use when asked to "make it look like <brand>", "add a DESIGN.md", "use <brand>'s design system", or "list available DESIGN.md styles".
argument-hint: <brand>
---

# DESIGN.md from awesome-design-md

Source: https://github.com/VoltAgent/awesome-design-md (one folder per brand under `design-md/`).

1. If no brand is given, or the user asks what's available, list the folders:
   `https://api.github.com/repos/VoltAgent/awesome-design-md/contents/design-md`
2. Download the brand's file into the project root:
   `curl -fsSL https://raw.githubusercontent.com/VoltAgent/awesome-design-md/main/design-md/<brand>/DESIGN.md -o DESIGN.md`
   If `DESIGN.md` already exists, ask before overwriting it.
3. Read `DESIGN.md` and follow it for all UI work in this project. Suggest committing it so it follows the repo.