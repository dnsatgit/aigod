# aigod Architecture

## Overview

aigod is a master orchestrator framework that runs inside Claude Code. It uses a layered architecture where each layer has a single responsibility.

## Layer Stack

```
┌─────────────────────────────────┐
│  User Interface (Claude Code)   │  ← User interacts here
├─────────────────────────────────┤
│  Context Manager (OpenViking)   │  ← L0/L1/L2 tiered loading + session compression
├─────────────────────────────────┤
│  Orchestrator (CLAUDE.md)       │  ← Task classification + routing
├─────────────────────────────────┤
│  Roles (roles/)                 │  ← Specialist personas
├─────────────────────────────────┤
│  Skills (.claude/skills/)       │  ← Stateless capabilities
├─────────────────────────────────┤
│  Constraints (impeccable, etc.) │  ← Mandatory standards
├─────────────────────────────────┤
│  Eval Layer (evals/)            │  ← Quality gates (promptfoo)
├─────────────────────────────────┤
│  Memory (memory/)               │  ← Persistent knowledge
├─────────────────────────────────┤
│  Tracker (tracker/)             │  ← Project state
└─────────────────────────────────┘
```

## Data Flow

1. **Task arrives** from user
2. **Orchestrator classifies** using routing keywords from `roles/index.yaml`
3. **Role loaded** — only the matched role's `.md` file enters context
4. **Skills invoked** if task triggers match (e.g., "diagram" → excalidraw)
5. **Constraints applied** automatically for matching domains (e.g., frontend → impeccable)
6. **Output generated** by the agent in the selected role
7. **Eval layer runs** — deterministic checks first, then LLM-graded if non-trivial
8. **Pass/Fail gate** — pass delivers to user, fail retries with feedback (max 3)
9. **State updated** — tracker and memory written as needed

## Key Design Decisions

### Roles vs Skills vs Constraints

| Concept | What it is | When loaded | Persistence |
|---------|------------|-------------|-------------|
| **Role** | A persona (how the agent behaves) | On task classification | Per-task |
| **Skill** | A capability (what the agent can do) | On trigger keyword match | Stateless |
| **Constraint** | A mandatory standard | Auto for matching domains | Always active |

### Context Management: OpenViking Tiered Loading

**Why tiered loading?** Context is not free. Every token loaded into the context window costs money and competes for attention. Loading 50,000 tokens of "just in case" context at session start is wasteful when you typically need ~3,000.

**The three tiers:**
- **L0 (Index)**: File names, descriptions, routing keywords. ~200 tokens. Always loaded.
- **L1 (Summary)**: Frontmatter, section headers, key decisions. ~500-1000 tokens. Loaded on classification.
- **L2 (Full)**: Complete file contents. Variable. Loaded only when actively working on that item.

**Why session compression?** Long conversations accumulate dead context — resolved decisions, verbose tool outputs, completed sub-tasks. Compression extracts what matters (learnings → memory, decisions → tracker) and releases the rest, keeping the session performant.

**Why observable context?** If the agent makes a bad decision because it loaded the wrong context, you need to know. Every decision cites what informed it.

### Eval Strategy: Two Tiers

**Why two tiers?** Cost. Deterministic checks are free and catch structural issues. LLM-graded checks cost ~$0.001 each (haiku) and catch semantic issues. Running both gives high coverage at minimal cost.

**Why haiku as grader?** The grader model doesn't need to be as capable as the agent model. It just needs to evaluate against a rubric — haiku handles this well at 1/60th the cost of opus.

### Memory: Files, Not Database

Memory is stored as markdown files with YAML frontmatter. This means:
- It lives in the git repo (version controlled)
- It's human-readable and editable
- No external dependencies
- Works offline

### Single Source of Truth: Tracker

The tracker is deliberately simple (one markdown file) because:
- Complex state management adds overhead without proportional value
- Markdown is readable by both the agent and the user
- Git provides history
