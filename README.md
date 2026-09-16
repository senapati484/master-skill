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

## Installation

Choose your installation method below. Each environment has its own dedicated setup:

### 1. One-Line Auto Install (All Agents)

Automatically detects and installs `master-skill` across all installed agents on your machine (`~/.claude/skills`, `~/.gemini/config/skills`, and `~/.agents/skills`):

```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash
```

---

### 2. Google Antigravity / Gemini CLI

Install specifically for Google Antigravity (`~/.gemini/config/skills/master-skill`):

**Via Quick Installer:**
```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --antigravity
```

**Or via Git Clone:**
```bash
git clone https://github.com/senapati484/master-skill.git ~/.gemini/config/skills/master-skill
```

---

### 3. Claude Code

Install specifically for Claude Code (`~/.claude/skills/master-skill`):

**Via Quick Installer:**
```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --claude
```

**Or via Git Clone:**
```bash
git clone https://github.com/senapati484/master-skill.git ~/.claude/skills/master-skill
```

---

### 4. Cursor / Codex / OpenCode

Install into the universal AgentSkills standard directory (`~/.agents/skills/master-skill`):

**Via Quick Installer:**
```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --agents
```

**Or via Git Clone:**
```bash
git clone https://github.com/senapati484/master-skill.git ~/.agents/skills/master-skill
```

---

### 5. Project-Local (Current Workspace)

Install directly into your current repository (`.agents/skills/master-skill`) so the skill travels with your project:

**Via Quick Installer:**
```bash
curl -fsSL https://raw.githubusercontent.com/senapati484/master-skill/main/install.sh | bash -s -- --project
```

**Or Manual Setup:**
Copy into `.agents/skills/master-skill/` or `.claude/skills/master-skill/` and reference it from `CLAUDE.md`, `AGENTS.md`, or `GEMINI.md`.

---

### 6. Local Clone Installation

If you have already cloned this repository locally, run:

```bash
./install.sh
```

**Supported Options:**

| Command | Target Location |
|---|---|
| `./install.sh --all` | All detected agents on your system (default) |
| `./install.sh --antigravity` | `~/.gemini/config/skills/master-skill` |
| `./install.sh --claude` | `~/.claude/skills/master-skill` |
| `./install.sh --agents` | `~/.agents/skills/master-skill` |
| `./install.sh --project` | `.agents/skills/master-skill` (current repo) |


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

