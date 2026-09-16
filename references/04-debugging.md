# 04 — Systematic Debugging

## The Iron Law

```
NO FIX WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

A fix that makes a symptom disappear without an explanation of *why* it
happened is not a fix — it's a guess that happened to change behavior.

## Use This For

Any bug, test failure, unexpected output, performance issue, or build
failure — especially under time pressure, since urgency is exactly when
guessing feels most tempting and costs the most rework.

## Phase 1 — Investigate

- Read the full error message and stack trace, not just the first line.
  Errors usually contain the actual answer.
- Reproduce the issue reliably. If you can't reproduce it, you can't verify
  a fix either — narrow down the exact trigger first.
- Trace backward from the symptom to find where the actual wrong state or
  wrong decision was introduced, not just where it became visible.
- Check recent changes (git log/diff) if the bug is new — it usually
  correlates with something that changed recently.

## Phase 2 — Isolate

Narrow the problem to the smallest reproducible case. Binary-search the
code path if needed: comment out / bypass halves of the logic to find which
half contains the bug.

## Phase 3 — Identify Root Cause

State the root cause as a sentence: "X happens because Y, which is caused by
Z." If you can't complete that sentence with evidence (not a guess), you
haven't found the root cause yet — keep investigating.

## Phase 4 — Fix and Verify

- Fix the root cause, not the symptom nearest to where it surfaced.
- Add or confirm a test that would have caught this (see `03-tdd.md`).
- Re-run the original reproduction steps to confirm the symptom is gone.
- Check for the same root cause elsewhere in the codebase — one instance of
  a root cause is often not the only one.

## Red Flags You're About to Skip a Phase

- "It's probably just..." without having reproduced it
- Trying a fix because it worked for a similar-looking issue before
- Multiple fix attempts already failed — that's a sign you're patching
  symptoms, not treating the cause. Stop and go back to Phase 1.

## Handoff

Once root cause is confirmed, implement the fix following `03-tdd.md`
(failing test first), then `07-verification.md` before calling it resolved.
