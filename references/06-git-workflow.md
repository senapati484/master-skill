# 06 — Git Workflow

## Starting Work

- Create a dedicated branch (or worktree, if working on multiple things in
  parallel) before making changes — never commit exploratory work directly
  to main/master.
- Confirm the test suite is clean on the base branch *before* you start, so
  you know any failures later are yours, not pre-existing.
- Use a descriptive branch name tied to the task, not `fix` or `wip`.

## Working in Parallel

If multiple independent tasks are being worked simultaneously (by you across
sessions, or coordinated subagents), give each its own isolated branch or
worktree so they don't collide on uncommitted state.

## Committing

- Commit at meaningful checkpoints (e.g., after each GREEN step in TDD), not
  one giant commit at the end — this preserves the ability to bisect later.
- Write commit messages that explain *why*, not just *what* — the diff
  already shows what changed.

## Finishing a Branch

When the work is done and reviewed:

1. Confirm tests pass on the branch.
2. Decide explicitly: merge directly, open a PR, keep the branch for later,
   or discard it. Don't leave it in limbo.
3. Clean up the worktree/branch once merged or discarded so it doesn't
   accumulate as clutter.

## Handoff

If this was the final step of a plan, go to `07-verification.md` to confirm
completion before reporting back to the human.
