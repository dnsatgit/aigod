---
name: protocols
description: Established operational rules and lessons learned that guide agent behavior
type: project
---

# Protocols

<!--
  Protocols evolve over time as the agent learns from interactions.
  Each protocol follows this format:

  ## Protocol Name
  - **Trigger:** When this protocol applies
  - **Rule:** What to do
  - **Scope:** Where it applies (global, specific role, specific skill)
  - **Anti-patterns:** What to avoid
  - **Origin:** How this protocol was established (user correction, incident, etc.)
-->

## Confirm Before Critical Changes
- **Trigger:** Any change to infrastructure, security, data, or production configs
- **Rule:** Always confirm with the user before executing. Never batch critical changes.
- **Scope:** Global
- **Anti-patterns:** Assuming approval based on previous session. Combining critical with non-critical changes.
- **Origin:** Framework default

## Eval Before Deliver
- **Trigger:** Any non-trivial output
- **Rule:** Run through the eval layer before presenting to the user. Retry on failure (max 3).
- **Scope:** Global
- **Anti-patterns:** Skipping eval for "simple" tasks. Delivering failed outputs with caveats.
- **Origin:** Framework default
