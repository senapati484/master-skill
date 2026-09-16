# 09 — Extending master-skill

Use this when a new recurring pattern shows up often enough that it deserves
its own reference module (e.g., a project-specific deployment checklist, a
domain-specific review pattern, a specific framework's testing quirks).

## When to Add a New Reference File

- The pattern isn't intuitively obvious and you'd reference it again
- It applies broadly across tasks, not just one project
- It's a judgment call, not something better enforced by a linter/CI check
  (automate those instead of documenting them)

## When Not To

- One-off, project-specific conventions — put those in the project's own
  `CLAUDE.md`/`AGENTS.md` instead
- Anything mechanically enforceable (formatting, import order) — use tooling

## How to Add One

1. Create `references/NN-topic-name.md` (numbered after the existing files —
   currently up to `09`, so start new additions at `10` — so ordering stays
   meaningful).
2. Keep it scoped to one concern — don't fold two unrelated topics together.
3. Write it the way the other reference files are written: short overview,
   a concrete rule, a checklist or steps, red flags, a handoff line.
4. Add one row to the Phase Router table in `SKILL.md` and update `references/00-master-skills-catalog.md`.
5. If it changes the Iron Laws or the approval gate, update the corresponding
   section in `SKILL.md` directly, not just the reference file.

## Testing a New or Changed Module

Before trusting a new reference file, deliberately try to get an agent to
violate it (skip the step, rationalize around it) with the file absent, then
present, then check the rule actually holds. If an agent talks its way
around the rule, the wording needs tightening, not the agent's behavior.
