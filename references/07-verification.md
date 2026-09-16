# 07 — Verification Before Completion

## The Rule

Don't say "done," "fixed," or "should work" without having just verified it.
A claim without evidence is a guess wearing the clothes of a fact.

## Checklist Before Declaring Completion

- [ ] The specific test(s) for this change pass — you ran them, not assumed
      them.
- [ ] The full relevant test suite still passes (no regressions elsewhere).
- [ ] The original request/spec is satisfied — re-read it and check line by
      line, not from memory.
- [ ] If it was a bug fix: the original reproduction steps no longer trigger
      the bug.
- [ ] No leftover debug code, commented-out blocks, or stray files.
- [ ] Anything you were unsure about is flagged explicitly to the human,
      not silently smoothed over.

## Red Flags in Your Own Reasoning

- "This should fix it" without having run anything — run it.
- "The logic looks right" as a substitute for actually executing the test.
- Reporting success based on partial output (e.g., only checking the last
  test in a suite ran clean, not the whole suite).

## Handoff

If everything checks out, report completion with what you verified and how.
If something's uncertain, say so explicitly rather than rounding up to
"done."
