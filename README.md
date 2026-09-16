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

## Quick Install (One-Line Command)

Run this single command in your terminal to automatically detect and install `master-skill` for **all** your installed AI coding agents (Claude Code, Antigravity, Cursor, Codex, Gemini CLI):

```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash
```

### Install to Specific Target or Current Project

```bash
# Install to current project repository only (.agents/skills/master-skill)
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --project

# Install only for Claude Code (~/.claude/skills)
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --claude

# Install only for Antigravity (~/.gemini/config/skills)
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --antigravity

# Install only for Cursor / Codex / Agents (~/.agents/skills)
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --agents
```

### From Local Clone

If you have cloned this repository locally, simply run:
```bash
./install.sh
```

### Manual Installation (Alternative)

If you prefer to clone or copy manually:

- **Claude Code**:
  ```bash
  git clone https://github.com/senapati484/master-skill.git ~/.claude/skills/master-skill
  ```
- **Antigravity**:
  ```bash
  git clone https://github.com/senapati484/master-skill.git ~/.gemini/config/skills/master-skill
  ```
- **Cursor / Codex / Gemini CLI**:
  ```bash
  git clone https://github.com/senapati484/master-skill.git ~/.agents/skills/master-skill
  ```
- **Project-Local (Any Agent)**:
  Copy into `.agents/skills/master-skill/` or `.claude/skills/master-skill/` in your repository root and reference it from `CLAUDE.md`, `AGENTS.md`, or `GEMINI.md`.


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

