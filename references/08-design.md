# 08 — Visual & UX Design

Purpose: stop UI work from defaulting to generic, template-looking output.
Applies to anything with a visible interface — a new screen, a redesign, a
component library, a marketing page, a CLI's output formatting.

This phase sits after `01-brainstorming.md` (what to build is already
approved) and before `03-tdd.md` (implementation). Design decisions get
proposed and reviewed here; code gets written there.

## Step 0 — Ground in Product Truth: `/impeccable init`

Before inventing visual styling or picking tokens, confirm durable product context:

1. **Check for `PRODUCT.md`**:
   - If missing in the project root, run **`/impeccable init`** (or `node .agent/skills/impeccable/scripts/context.mjs`).
   - It captures the primary user, job to be done, positioning, constraints, and platform (`web`, `ios`, `android`) into `PRODUCT.md`.
2. **Never skip or invent product truth**:
   - Visual choices must reflect the verified product facts recorded in `PRODUCT.md`.
   - If an existing interface already exists without documentation, run **`/impeccable document`** to record the incumbent system into `DESIGN.md`.

## Impeccable Command Toolset

Leverage the Impeccable skill suite throughout this phase:

- **`/impeccable init`** — Capture durable product truth in `PRODUCT.md`.
- **`/impeccable shape <feature>`** — Plan UX and screen concepts before code.
- **`/impeccable document`** — Reverse-engineer existing styling into `DESIGN.md`.
- **`/impeccable extract <target>`** — Harvest tokens and reusable components.
- **`/impeccable critique <target>`** — Run heuristic UX review on interface hierarchy.
- **`/impeccable audit <target>`** — Run accessibility (WCAG 2.2), responsive, and performance checks.
- **`/impeccable polish <target>`** — Perform craft-floor review to remove AI visual clichés.
- **`/impeccable bolder` / `/impeccable quieter`** — Calibrate visual intensity and personality.
- **`/impeccable live`** — Interactive browser variant session for real-time tweaking.

## Know the Defaults So You Can Avoid Them

AI-generated UI clusters around a handful of recognizable looks — a warm
cream background with a serif display face and a terracotta accent; a
near-black background with one neon accent; a broadsheet layout with hairline
rules and dense columns. None of these are wrong, but landing on one by
default (rather than because the brief calls for it) is the failure mode this
phase exists to catch. If the brief already specifies a direction, follow it
exactly — the brief always wins.

## Ground the Design in the Actual Subject

Before choosing colors or type, name the real subject, its audience, and the
one job this screen/page needs to do. Distinctive choices come from the
subject's own world — its materials, vocabulary, and context — not from a
generic template applied to any project.

## Build a Token System Before Writing Code

Propose these explicitly, as a short plan (persisted in `DESIGN.md` if using Impeccable), before implementation:

- **Color** — 4-6 named hex values with a clear role for each (background,
  text, accent, etc.), not "primary/secondary" left vague.
- **Type** — at least two roles (a display face used with restraint, a
  complementary body face), with a defined scale of sizes/weights.
- **Layout** — the structural concept in a sentence or two, plus a rough
  wireframe (ASCII is fine) if it's non-trivial.
- **Signature** — the one deliberate, memorable element this design will be
  known for. Spend boldness here; keep everything else disciplined around it.

## Self-Critique Before Building

Check the proposed plan against the brief: would this same plan have come out
for a different, unrelated project with a similar prompt? If yes, it's a
default, not a choice — revise it and note what changed and why. Only start
implementation once the plan reads as specific to this brief. Run `/impeccable critique` if needed.

## Content & Copy Are Design Material

- Name things by what the user does or sees, not by internal implementation
  ("manage notifications," not "webhook settings").
- Use active voice and keep verb choice consistent through a flow (a button
  that says "Publish" should lead to a confirmation that says "Published,"
  not "Submitted").
- Error and empty states explain what happened and what to do next, in the
  product's voice — never vague, never apologetic filler.

## Non-Negotiable Quality Floor

Regardless of aesthetic direction, always ship (validate with `/impeccable audit`):

- [ ] Responsive down to mobile width
- [ ] Visible keyboard focus states
- [ ] Reduced-motion respected for any animation
- [ ] Sufficient color contrast for body text (WCAG AA minimum)
- [ ] Touch targets sized (min 44x44px) and positioned for thumb reach on mobile (primary
      actions reachable in the lower two-thirds of the screen)

## Handoff

Once the design plan is reviewed and approved, implement it following
`03-tdd.md` for any interactive logic, and `07-verification.md` before
declaring the UI work complete — verification here includes actually
looking at the rendered result (screenshot or live view), running `/impeccable polish` / `/impeccable audit`, not just trusting
that the code compiles.

## Project-Specific Note

If a project already has its own design-system skill installed (such as Impeccable or Anthropic's `frontend-design` skill, or a project-local design-tokens file),
defer to that skill's specifics for exact tokens and treat this file as the
higher-level checklist that makes sure the design phase happens at all.
