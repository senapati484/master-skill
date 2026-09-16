# 02 — Planning

Purpose: turn an approved design into a sequence of small, independently
verifiable tasks — not one large undifferentiated block of "implement the
feature."

## Task Sizing

Each task should be small enough to:
- Have one clear file (or tight cluster of files) it touches
- Be verifiable on its own (a test passes, a command runs, an output matches)
- Be describable in a couple of sentences without "and also..."

If a task needs "and also," split it.

## Each Task Should Specify

1. What file(s) it touches
2. What the change is (concrete enough that no design decisions remain)
3. How to verify it worked (a test, a command, an observable behavior)
4. What "not done" looks like, if it's easy to get subtly wrong

## Ordering

- Put the riskiest / most uncertain task early — if the design has a flaw,
  find out before sinking time into the easy parts.
- Respect dependencies: data layer before the UI that reads it, interfaces
  before implementations that satisfy them.
- Keep test scaffolding and fixtures as their own early task, not bundled
  into the first feature task.

## Checkpoints

For anything more than a handful of tasks, insert a checkpoint every few
tasks where you summarize progress and confirm you're still aligned with the
design — plans drift once implementation reveals things the design missed.

## Handoff

Work through tasks one at a time using `03-tdd.md` for implementation and
`07-verification.md` before marking each task complete.
