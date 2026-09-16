# 01 — Brainstorming & Design Approval

Purpose: never let an agent jump straight from "build X" to writing code.
Rough ideas need to become an approved design first — even a small one.

## Step 1 — Classify the Task

Say the classification out loud so the human can correct it if it's wrong.

- **Spike** — a feasibility question ("can we...", "is this possible...").
  Output is an answer, not kept code. State the question and what you'll try
  in 2-3 sentences, get a nod, then find out as cheaply as possible. Label
  anything you build as throwaway.
- **Bounded** — a well-scoped change to code that already exists: a new flag,
  a small endpoint, a one-file fix. If there's no existing flow to change,
  it's not bounded — treat it as architectural instead. Ask only the
  clarifying questions that matter, present a short design in a few
  sentences, then stop and wait for a yes.
- **Architectural** — a new project, a new subsystem, or a change that alters
  how components talk to each other or what other code depends on. Full
  process: clarifying questions, a couple of alternative approaches, a
  sectioned design presented for feedback, then a written spec.

When unsure which bucket a task falls into, pick the heavier one. If hidden
complexity surfaces mid-task, upgrade the classification immediately — never
downgrade mid-task.

**UI / Frontend Note:** If the task involves a visible UI, dashboard, landing page, or frontend component, check whether `PRODUCT.md` exists. If not, invoke `/impeccable init` during or immediately following classification to anchor product context.

## Step 2 — Ask, Don't Assume

Ask only the questions whose answers would actually change the design:
constraints, target users, non-negotiables, what "done" looks like. Skip
questions you can answer yourself by reading the code.

## Step 3 — Present the Design

- Spike: a recommendation with findings.
- Bounded: a short paragraph in chat.
- Architectural: a design broken into digestible sections (goals,
  approach, tradeoffs, open questions), presented one section at a time if
  it's long, so it stays reviewable rather than being a wall of text.
- UI / Frontend: include the token concept, screen layout/ASCII wireframe, and planned Impeccable commands (see `08-design.md`).

## Step 4 — Get Explicit Approval

No code, no scaffolding, no dependency installs, no migrations until the
human says yes. A thumbs-up on the entire design counts; silence does not.

## Anti-Patterns to Watch For in Yourself

- "This is too simple to need approval" — simple tasks are exactly where
  unstated assumptions cause the most wasted work.
- Treating "I understand the codebase" as equivalent to "this is bounded."
  Understanding is not the same as the flow already existing in the repo.
- Writing a paragraph of code while "just sketching" the design — sketches
  stay in prose or diagrams until the gate is cleared.

## Handoff

Once approved:
- For tasks with a visible interface, route through `/impeccable init` (if `PRODUCT.md` is missing) and `08-design.md` before planning and code.
- For architectural/bounded tasks with multiple steps, go to `02-planning.md`.
- For single small non-UI logic changes, go straight to `03-tdd.md`.

