# aigod

A generic, cloneable master agent framework. Feed it your domain specs — get a fully orchestrated AI agent system with dynamic sub-agents, skills, eval-gated quality, and persistent memory.

Clone it. Customize it. Ship it.

---

## What is aigod?

aigod is an **opinionated orchestrator framework** that lives in your git repo. It turns a single Claude Code agent into a full operations team by dynamically routing tasks to specialized sub-agents, invoking skills on demand, and quality-gating every output through an eval layer.

**You provide:** Your company/project specs, domain knowledge, and preferences.
**aigod provides:** The architecture, routing, evaluation, memory, and coordination.

```
Your Domain Specs + aigod Framework = Production-Ready Master Agent
```

---

## Architecture

```
User Task
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│  MASTER ORCHESTRATOR                                    │
│                                                         │
│  1. Classify task domain                                │
│  2. Select role from catalog (120+ available)           │
│  3. Load relevant skills (diagram, simulate, etc.)      │
│  4. Apply constraint layers (frontend, security, etc.)  │
│                                                         │
│  ┌───────────────────────────────────────────┐          │
│  │  Sub-Agent executes (role + skills)       │          │
│  └──────────────┬────────────────────────────┘          │
│                 │                                        │
│  ┌──────────────▼────────────────────────────┐          │
│  │  Eval Layer (promptfoo)                   │          │
│  │  ├── Deterministic checks (free)          │          │
│  │  └── LLM-graded rubrics (haiku, cheap)    │          │
│  └──────────────┬────────────────────────────┘          │
│                 │                                        │
│         PASS? ──┤── FAIL → retry (max 3) → escalate    │
│                 │                                        │
│  5. Log decision + update tracker                       │
│  6. Deliver output                                      │
└─────────────────────────────────────────────────────────┘
```

---

## Core Layers

| Layer | Purpose | Location |
|-------|---------|----------|
| **Orchestrator** | Task classification, routing, state management | `CLAUDE.md` |
| **Roles** | 120+ specialist personas across 12 divisions | `roles/` |
| **Skills** | Stateless capabilities invoked on demand | `.claude/skills/` |
| **Evals** | Quality gates on every output (promptfoo + haiku) | `evals/` |
| **Constraints** | Mandatory standards for specific domains (e.g., frontend) | `.claude/skills/impeccable/` |
| **Memory** | Persistent cross-session knowledge | `memory/` |
| **Tracker** | Single source of truth for project state | `tracker/` |

---

## Quick Start

### 1. Clone

```bash
git clone https://github.com/YOUR_USERNAME/aigod.git
cd aigod
```

### 2. Install dependencies

```bash
npm install
```

### 3. Customize for your domain

```bash
# Follow the interactive customization guide
cat CUSTOMIZE.md
```

Or manually:

1. **Add your specs** — Drop your company/project documentation into `docs/domain/`
2. **Configure roles** — Enable/disable roles in `roles/index.yaml` for your domain
3. **Set eval criteria** — Edit `evals/promptfooconfig.yaml` with your quality standards
4. **Seed memory** — Add initial context to `memory/` (who you are, project goals, preferences)

### 4. Run

Open the project in your editor with Claude Code, or:

```bash
claude
```

The orchestrator reads `CLAUDE.md` on startup, loads memory, checks the tracker, and is ready to work.

---

## Directory Structure

```
aigod/
├── CLAUDE.md                    # Master orchestrator definition
├── CUSTOMIZE.md                 # Step-by-step domain customization guide
├── package.json                 # Dependencies (promptfoo, etc.)
├── .gitignore
│
├── .claude/
│   ├── commands/                # Custom slash commands
│   └── skills/
│       ├── excalidraw/          # Diagramming skill
│       │   ├── SKILL.md
│       │   └── references/
│       ├── mirofish/            # Predictive simulation skill
│       │   └── SKILL.md
│       └── impeccable/          # Frontend constraint layer
│           ├── SKILL.md
│           └── references/
│
├── roles/
│   ├── index.yaml               # Role routing index
│   ├── engineering/             # 23 engineering roles
│   ├── design/                  # 8 design roles
│   ├── marketing/               # 28+ marketing roles
│   ├── sales/                   # 8 sales roles
│   ├── product/                 # 5 product roles
│   ├── project-management/      # 6 PM roles
│   ├── testing/                 # 8 QA roles
│   ├── support/                 # 6 support roles
│   └── specialized/             # 27 specialized roles
│
├── evals/
│   ├── promptfooconfig.yaml     # Global eval configuration
│   ├── assertions/              # Reusable assertion sets
│   │   ├── quality.yaml
│   │   ├── safety.yaml
│   │   └── domain.yaml
│   └── datasets/                # Test datasets per role
│
├── memory/
│   ├── MEMORY.md                # Memory index (always loaded)
│   └── protocols.md             # Established rules + lessons
│
├── tracker/
│   └── tracker.md               # Single source of truth for project state
│
├── docs/
│   ├── architecture.md          # Detailed architecture documentation
│   ├── domain/                  # YOUR domain specs go here
│   └── examples/                # Example configurations
│
└── scripts/
    └── setup.sh                 # Initial setup script
```

---

## Roles

aigod ships with **120+ pre-built specialist roles** across 12 divisions:

| Division | Roles | Examples |
|----------|-------|---------|
| Engineering | 23 | Software Architect, Senior Dev, AI Engineer, DevOps, SRE |
| Design | 8 | UI Designer, UX Researcher, Brand Guardian |
| Marketing | 28+ | Growth Hacker, SEO Strategist, Content Creator |
| Sales | 8 | Outbound Strategist, Deal Closer, Sales Engineer |
| Product | 5 | Sprint Prioritizer, Feedback Synthesizer, Product Manager |
| Project Management | 6 | Studio Producer, Project Shepherd, Jira Steward |
| Testing | 8 | Evidence Collector, Reality Checker, API Tester |
| Support | 6 | Analytics Reporter, Finance Tracker, Legal Compliance |
| Spatial Computing | 6 | XR Architect, visionOS Engineer |
| Specialized | 27 | MCP Builder, Document Generator, Workflow Architect |
| Game Dev | Varies | Engine Specialists, Level Design, Game AI |
| Paid Media | 7 | PPC, Programmatic, Paid Social |

Each role is a standalone `.md` file with: Identity, Core Mission, Critical Rules, Workflow, Decision Logic, Communication Style, and Success Metrics.

**You don't need all of them.** Enable only what your domain requires via `roles/index.yaml`.

---

## Skills

Skills are **stateless tools** the orchestrator invokes on demand. Unlike roles (which define *how* the agent behaves), skills define *what* it can do.

| Skill | Triggers | Description |
|-------|----------|-------------|
| **excalidraw** | "visualize", "diagram", "architecture" | Generates Excalidraw JSON diagrams with render-validate loop |
| **mirofish** | "predict", "simulate", "scenario", "what if" | Multi-agent simulation for strategic foresight and data-driven predictions |
| **impeccable** | Any frontend output | Constraint layer enforcing 21 frontend design standards (not optional) |

### Adding Custom Skills

```
.claude/skills/your-skill/
├── SKILL.md          # Frontmatter + methodology
└── references/       # Supporting assets
```

---

## Eval Layer

Every output passes through a **two-tier evaluation gate** powered by [promptfoo](https://github.com/promptfoo/promptfoo):

### Tier 1 — Deterministic (free)
- `contains` / `not-contains` — required/blocked phrases
- `is-json` / `regex` — structural validation
- `cost` / `latency` — budget and performance gates

### Tier 2 — LLM-Graded (cheap, ~$0.001/eval)
- Uses `claude-haiku-4-5` as the grader (not the main model)
- `llm-rubric` — custom quality criteria per role
- `model-graded-closedqa` — factual accuracy checks
- `similar` — semantic similarity scoring

### Control Flow
```
Output → Eval → PASS → Deliver
                FAIL → Retry with feedback (max 3) → Escalate to user
```

### Composite Score
```
quality * 0.6 + relevance * 0.3 + cost_efficiency * 0.1
```

---

## Memory System

aigod maintains persistent memory across sessions:

| Type | Purpose | Example |
|------|---------|---------|
| **user** | Who you are, your preferences | "Senior engineer, prefers terse responses" |
| **feedback** | Corrections and confirmed approaches | "Don't mock the database in integration tests" |
| **project** | Ongoing work context | "Auth rewrite driven by compliance, not tech debt" |
| **reference** | Pointers to external systems | "Bugs tracked in Linear project INGEST" |

Memory is stored as individual `.md` files with structured frontmatter, indexed in `MEMORY.md`.

---

## Customization

See [CUSTOMIZE.md](CUSTOMIZE.md) for the full guide. The short version:

1. **Drop your specs** into `docs/domain/`
2. **Pick your roles** — edit `roles/index.yaml`
3. **Define your quality bar** — edit `evals/promptfooconfig.yaml`
4. **Seed your memory** — add context files to `memory/`
5. **Add domain skills** — create new skills in `.claude/skills/`

aigod adapts to any domain: software teams, agencies, consulting firms, research labs, content studios, or solo operators.

---

## Examples

### Software Team
```yaml
# roles/index.yaml
enabled_divisions:
  - engineering
  - testing
  - product
```

### Marketing Agency
```yaml
# roles/index.yaml
enabled_divisions:
  - marketing
  - design
  - sales
  - paid-media
```

### Solo Founder
```yaml
# roles/index.yaml
enabled_roles:
  - engineering/software-architect
  - product/sprint-prioritizer
  - marketing/growth-hacker
  - design/ui-designer
```

---

## Requirements

- [Claude Code](https://claude.ai/code) (CLI)
- Node.js 18+ (for promptfoo)
- Git

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

---

## License

MIT — see [LICENSE](LICENSE).

---

Built for the age of AI agents. Clone it. Make it yours.
