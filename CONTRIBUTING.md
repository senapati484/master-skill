# Contributing to master-skill

Thank you for your interest in contributing to **master-skill**!

This repository aims to be a single, disciplined, agent-agnostic workflow skill for all AI coding agents (Claude Code, Antigravity, Cursor, Codex, OpenCode, Gemini CLI, etc.).

## How to Contribute

### 1. Adding a New Reference Module
If you find a recurring engineering workflow or domain pattern that belongs in `master-skill`:
1. Check `references/09-extending.md` for guidelines on when to add a module.
2. Create `references/NN-topic-name.md` (e.g. `references/10-your-module.md`).
3. Follow the established structure: Purpose, Concrete Rules, Steps/Checklists, Red Flags, and Handoff.
4. Update the Phase Router in `SKILL.md` and the matrix in `references/00-master-skills-catalog.md`.
5. Update `README.md` to document the new module.

### 2. Refining Existing Modules
- Edits to existing reference files should tighten rules and prevent rationalization.
- The two Iron Laws (`NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST` and `NO FIX WITHOUT ROOT CAUSE INVESTIGATION FIRST`) and the Design-Approval Gate are foundational and cannot be weakened or removed.

### 3. Pull Request Guidelines
- Ensure all markdown links and references are valid.
- Verify no duplicate or stray files are added.
- Keep commits clear, descriptive, and atomic.

## License

By contributing to this repository, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).
