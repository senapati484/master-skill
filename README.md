# master-skill

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Spec: AgentSkills](https://img.shields.io/badge/Spec-AgentSkills.io-orange.svg)](https://agentskills.io)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A single, agent-agnostic skill that gives any coding agent a disciplined
end-to-end workflow: design approval → planning → TDD → debugging →
review → git hygiene → verification. Built by distilling the patterns
shared across the most-used community skill frameworks (obra/superpowers
and related collections) into one easy-to-install folder instead of a dozen
separate plugins.

## Install

### Claude Code
Copy this folder into your skills directory:
```
cp -r master-skill ~/.claude/skills/master-skill
```
Restart Claude Code (or start a new session) — it loads automatically.

### Codex / Copilot CLI / Gemini CLI
These also read `~/.agents/skills/` as a shared path:
```
cp -r master-skill ~/.agents/skills/master-skill
```

### Cursor / OpenCode / Antigravity
Drop the folder into whatever skills/plugin directory your version of the
tool watches (check its docs — most have converged on `SKILL.md` with YAML
frontmatter as the standard format, per the agentskills.io spec). If the
tool supports project-local skills, you can also place it inside your repo
at `.claude/skills/master-skill/` (or the equivalent) so it travels with the
project instead of being global.

### Project-local (any agent, any tool)
Put it in the repo itself and reference it from `CLAUDE.md` / `AGENTS.md`:
```
.claude/skills/master-skill/SKILL.md
```

## How It Works

`SKILL.md` is the only file that loads automatically. It's short by design
— it just routes to the right file in `references/` depending on what
you're doing. The agent is instructed to check this router before writing
code, proposing a fix, or declaring something done.

## Files

| File | Covers |
|---|---|
| `SKILL.md` | Entry point, phase router, the two Iron Laws |
| `references/00-master-skills-catalog.md` | Unified AI capability matrix, specialized engineering domains & slash commands |
| `references/01-brainstorming.md` | Task sizing, design approval before code |
| `references/02-planning.md` | Breaking approved work into small tasks |
| `references/03-tdd.md` | Red-Green-Refactor |
| `references/04-debugging.md` | Root-cause-first bug fixing |
| `references/05-code-review.md` | Severity-ranked review |
| `references/06-git-workflow.md` | Branches, worktrees, merge decisions |
| `references/07-verification.md` | Proof before "done" |
| `references/08-design.md` | Deliberate visual/UX design plan & Impeccable integration (`/impeccable init`) before UI code |
| `references/09-extending.md` | How to safely add more modules later |

## Impeccable Design Integration

For frontend and user-facing surfaces, `master-skill` integrates the **Impeccable** design command suite directly into the workflow:
- Run **`/impeccable init`** before writing UI code to capture durable product truth in `PRODUCT.md`.
- Use **`/impeccable shape`** for pre-code UX concepting.
- Use **`/impeccable document`** to reverse-engineer an existing design system into `DESIGN.md`.
- Use **`/impeccable audit`** and **`/impeccable polish`** before completing UI tasks.

## Extending for Your Own Projects (e.g. Open* portfolio)

If you want project-specific modules — an Electron/IPC checklist for
OpenGamma-style apps, a Tauri-specific pattern for OpenPRD/OpenFret, an
FFmpeg pipeline checklist for OpenClip — follow `references/09-extending.md`
to add them without breaking the router. That keeps one master-skill per
machine instead of a different bespoke skill per repo.

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on proposing new workflow modules or improving existing references.

## License

This project is licensed under the [MIT License](LICENSE).

