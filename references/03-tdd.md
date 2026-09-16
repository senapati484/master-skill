# 03 — Test-Driven Development

## The Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

If code got written before its test, delete it — don't keep it as
"reference," don't peek at it while writing the test. Delete means delete,
then implement fresh once the test exists.

## When This Applies

Always, for: new features, bug fixes, refactors, any behavior change.

Ask the human first if it's a genuine one-off: throwaway prototype code,
machine-generated boilerplate, or plain config/data files with no logic.
"I'll skip it just this once" for anything else is the rationalization this
law exists to block.

## The Cycle

1. **RED** — write a test for behavior that doesn't exist yet. Run it. Watch
   it fail, and confirm it fails for the *right* reason (not a typo or
   missing import).
2. **GREEN** — write the minimum code that makes the test pass. Resist
   adding anything the test doesn't require yet.
3. **REFACTOR** — clean up duplication or awkward structure now that the
   behavior is locked in by a passing test. Run the test again after every
   change to make sure it still passes.
4. Repeat for the next smallest piece of behavior.

## Why Watching It Fail Matters

A test you never watched fail might be testing nothing — a typo in an
assertion, a mock that always returns true, a test that never actually runs.
The only way to know a test is real is to see it fail first, for the reason
you expect.

## Bug Fixes Specifically

Write a test that reproduces the bug before touching the fix. That test
should fail against the current (broken) code. Once it passes, it's your
permanent regression guard.

## Handoff

When a test fails and the cause isn't obvious, switch to
`04-debugging.md` rather than guessing at fixes.
