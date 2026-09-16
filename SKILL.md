---
name: master-skill
description: Use at the start of any coding task — building a feature, fixing a bug, reviewing code, or merging a branch. Routes to the right workflow (design, planning, TDD, debugging, review, git) before any code is written.
---

# Master Skill

One skill, one workflow, covers the whole software-development loop. It exists
so a coding agent stops guessing and starts following the same disciplined
process every time — design first, tests first, root cause first, review
before merge.

## The Rule

Before writing code, running a fix, or opening a PR, check the table below
and open the matching reference file. If more than one row applies, do them
in order — earlier rows gate later ones (you cannot skip design and jump to
TDD; you cannot skip root-cause analysis and jump to a fix).

If there's even a small chance a row applies, treat it as applying. "This is
simple" or "I already know how to do this" are not reasons to skip a step —
they're the exact thoughts that precede the mistakes this skill exists to
prevent.

## Phase Router

| Situation | Reference | What it forces |
|---|---|---|
| Session start, routing uncertainty, or capability lookup | `references/00-master-skills-catalog.md` | Full AI capability matrix, specialized domain skills & slash commands |
| Starting any new feature, component, or behavior change | `references/01-brainstorming.md` | Classify task size, get design approved before touching code |
| Design is approved, need to break it into work | `references/02-planning.md` | Small, verifiable, ordered tasks — not one giant step |
| Writing implementation code | `references/03-tdd.md` | Failing test before production code, always |
| A bug, test failure, or unexpected behavior appears | `references/04-debugging.md` | Root cause before any fix attempt |
| A task or PR is ready for review | `references/05-code-review.md` | Structured, severity-ranked feedback |
| Starting parallel work or finishing a feature branch | `references/06-git-workflow.md` | Isolated branches, clean merge/PR decisions |
| About to say "done" | `references/07-verification.md` | Proof, not a claim |
| Building or reshaping anything with a visible UI | `references/08-design.md` | Run `/impeccable init` (`PRODUCT.md`), deliberate UX/visual plan before code |
| This skill is missing something you keep needing | `references/09-extending.md` | How to add a new reference module without breaking the router |

**Ordering note for UI work:** when a task has a visible interface, the
sequence is brainstorming → **/impeccable init** (capture product truth in `PRODUCT.md`) → planning → **design** (`references/08-design.md` / `DESIGN.md`) → TDD/implementation.
Don't let implementation start before `PRODUCT.md` and the design plan in
`references/08-design.md` are proposed and approved — treat it as part of the
same approval gate as brainstorming, not an optional polish step.

## Two Iron Laws (never skipped, no exceptions)

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
NO FIX WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

Both are detailed in their reference files. If you find yourself writing code
before a test exists, or proposing a fix before you can explain *why* the bug
happens, stop and go back to the matching reference file.

## Design-Approval Gate

Do not scaffold a project, write implementation code, or run migrations until
a human has approved what you intend to build. The size of the approval scales
with the task (a one-line confirmation for a small fix, a written design for
a new subsystem) but the gate itself never disappears. See
`references/01-brainstorming.md` for how to size this correctly.

## Notes for This Agent

- This skill is intentionally agent-agnostic: it assumes only that you can
  read files and write code. It works whether you're running as Claude Code,
  Antigravity, Cursor, Codex, OpenCode, or any similar coding agent.
- If the project has its own `CLAUDE.md` / `AGENTS.md` / `GEMINI.md` with
  explicit instructions that conflict with this skill, the project
  instructions win. This skill fills gaps; it doesn't override an explicit
  human decision.
- Announce which reference file you're using and why, in one short line,
  before acting on it — this keeps the human able to interrupt or redirect.
