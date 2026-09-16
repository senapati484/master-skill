# 05 — Code Review

## Before Requesting Review

- Re-read the diff yourself first, as if it were someone else's code.
- Confirm it matches the approved design/plan — flag any deviation
  explicitly rather than letting a reviewer discover it.
- Run the full test suite, not just the tests for what you touched.
- Remove debug prints, commented-out code, and stray TODOs unless they're
  intentional and explained.

## Reviewing (Yours or Someone Else's)

Rank every issue found by severity, and say the severity out loud:

- **Critical** — breaks correctness, security, or data integrity. Blocks
  merge. Must be fixed before proceeding.
- **Important** — real problem, but not merge-blocking on its own (missing
  edge case, weak test coverage, unclear naming that will cause bugs later).
- **Minor / style** — worth mentioning, not worth blocking on.

Check against the original spec/plan, not just "does this look reasonable in
isolation" — code can look fine and still not do what was asked.

## Receiving Feedback

- Address critical and important issues before anything else.
- If you disagree with feedback, say why with specifics rather than silently
  ignoring it or silently complying without understanding.
- Don't treat "the tests pass" as proof the feedback is invalid — tests
  passing means the tests you wrote pass, not that the concern is wrong.

## Handoff

Once critical/important issues are resolved and tests pass, move to
`06-git-workflow.md` for merge/PR handling, or `07-verification.md` if this
was the last task in a plan.
