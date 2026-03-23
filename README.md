<p align="center">
  <img src="assets/banner.png" alt="aigod banner" width="100%">
</p>

<p align="center">
  <a href="#-quick-start"><img src="https://img.shields.io/badge/Get_Started-blue?style=for-the-badge" alt="Get Started"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License"></a>
  <a href="#-architecture"><img src="https://img.shields.io/badge/Claude_Code-Native-blueviolet?style=for-the-badge" alt="Claude Code"></a>
  <a href="CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-Welcome-orange?style=for-the-badge" alt="PRs Welcome"></a>
</p>

<p align="center">
  <strong>A cloneable master agent framework that turns Claude Code into your entire operations team.</strong><br>
  <sub>120+ specialist roles. Eval-gated quality. Persistent memory. Zero standups.</sub>
</p>

---

## The Problem

You're using Claude Code. It's great. But every session starts from scratch. It doesn't remember your conventions, doesn't know your team structure, doesn't enforce your quality bar, and definitely doesn't know that "Karen from legal flagged the auth tokens again."

You've been copy-pasting system prompts. Writing the same instructions. Getting inconsistent output. Watching it suggest `Inter` font for the hundredth time.

**aigod fixes this.**

## The Solution

aigod is an **opinionated orchestrator framework** that lives in your git repo. You clone it, feed it your domain specs, and it becomes a persistent, context-aware master agent that:

- **Routes tasks** to the right specialist from 120+ pre-built roles
- **Evaluates every output** through a two-tier quality gate before you see it
- **Remembers everything** across sessions — your preferences, past decisions, project context
- **Enforces standards** automatically (try shipping glassmorphism past the frontend constraint layer)
- **Learns from corrections** so you never repeat the same feedback twice

```
Your Domain Specs + aigod = Production-Ready Master Agent
```

> **Why "aigod"?** Because naming things is hard, and we figured if it's going to orchestrate 120+ specialists, manage persistent memory, enforce quality standards, and learn from its mistakes — it might as well have a name that matches the ambition.

---

## When Should You Use aigod?

| You should use aigod if... | You probably don't need aigod if... |
|---------------------------|-------------------------------------|
| You use Claude Code daily for real work | You're exploring Claude for the first time |
| You're tired of re-explaining your codebase every session | Your projects are small one-off scripts |
| Your team has conventions, standards, and processes | You don't care about output consistency |
| You want quality gates on AI output before it ships | You enjoy reviewing AI slop manually |
| You need different specialist behaviors for different tasks | One generic assistant is fine for everything |
| You want the agent to learn and improve over time | You like copy-pasting system prompts |

---

## With aigod vs. Without

| Capability | Claude Code (vanilla) | Claude Code + aigod |
|------------|----------------------|---------------------|
| Context management | Loads everything, hopes it fits | Three-tier loading (L0→L1→L2) — only pay for context you need |
| Task routing | Generic assistant for everything | 120+ specialist roles auto-selected per task |
| Quality control | Trust and hope | Two-tier eval gate (deterministic + LLM-graded) on every output |
| Session memory | Starts fresh each time | Persistent memory across all sessions |
| Domain knowledge | You re-explain every time | Loaded automatically from your specs |
| Session longevity | Context bloats, quality degrades | Auto-compression keeps sessions lean and focused |
| Frontend standards | "Here's some Tailwind" | 21 enforced design standards, auto-fail on AI slop |
| Error handling | Output whatever, you'll figure it out | Retry with feedback (max 3), then escalate |
| Learning | Doesn't | Saves corrections as protocols, never repeats mistakes |
| Cost awareness | Full-price model for everything | Haiku grader for evals (~$0.001/check), tiered context loading |

---

## Architecture

```mermaid
flowchart TB
    subgraph INPUT["Task Input"]
        USER[User Task]
    end

    subgraph ORCHESTRATOR["Master Orchestrator"]
        CLASSIFY[Classify Domain]
        ROUTE[Route to Role]
        LOAD[Load Skills + Constraints]
    end

    subgraph EXECUTION["Execution Layer"]
        ROLE[Specialist Role<br/>120+ available]
        SKILL1[Excalidraw<br/>Diagrams]
        SKILL2[MiroFish<br/>Simulation]
        CONSTRAINT[Impeccable<br/>Frontend Standards]
    end

    subgraph EVAL["Eval Layer — promptfoo"]
        T1[Tier 1: Deterministic<br/>FREE]
        T2[Tier 2: LLM-Graded<br/>Haiku ~$0.001]
    end

    subgraph STATE["Persistence"]
        MEMORY[Memory<br/>Cross-session]
        TRACKER[Tracker<br/>Project State]
        PROTOCOL[Protocols<br/>Learned Rules]
    end

    USER --> CLASSIFY
    CLASSIFY --> ROUTE
    ROUTE --> LOAD
    LOAD --> ROLE
    ROLE -.-> SKILL1
    ROLE -.-> SKILL2
    ROLE -.-> CONSTRAINT
    ROLE --> T1
    T1 --> T2
    T2 -->|PASS| OUTPUT[Deliver to User]
    T2 -->|FAIL| RETRY[Retry with Feedback<br/>max 3]
    RETRY --> ROLE
    OUTPUT --> MEMORY
    OUTPUT --> TRACKER
    RETRY -->|3 failures| ESCALATE[Escalate to User]

    style INPUT fill:#161b22,stroke:#58a6ff,color:#c9d1d9
    style ORCHESTRATOR fill:#161b22,stroke:#58a6ff,color:#c9d1d9
    style EXECUTION fill:#161b22,stroke:#bc8cff,color:#c9d1d9
    style EVAL fill:#161b22,stroke:#f78166,color:#c9d1d9
    style STATE fill:#161b22,stroke:#3fb950,color:#c9d1d9
```

---

## See It In Action

Here's what happens when you say **"Build me a dashboard page for analytics"**:

<p align="center">
  <img src="assets/usecase.png" alt="aigod use case example" width="100%">
</p>

**What just happened:**

1. **Classify** — Orchestrator detects engineering + design (frontend) task
2. **Route** — Loads Senior Dev as primary role, UI Designer for review
3. **Load Skills** — Excalidraw for architecture diagram, Impeccable as mandatory frontend constraint
4. **Load Memory** — Recalls you prefer Recharts and the project uses Next.js 14 app router
5. **Execute** — Agent generates code using YOUR stack, YOUR preferences, YOUR conventions
6. **Eval Gate** — Deterministic checks (free) + Haiku-graded quality rubrics ($0.001) — all pass
7. **Deliver** — Output lands in your hands, already validated
8. **Remember** — Tracker updated, decisions logged, preferences reinforced for next session

> Without aigod: "Here's a generic React dashboard with Chart.js and Inter font."
> With aigod: "Here's a Next.js 14 app router page using Recharts, OKLCH colors, 4pt grid, and your existing layout components."

---

## What's Under the Hood

aigod is built on the best open-source tools available — not reinventing wheels, but orchestrating them.

| Component | Powered By | Why This |
|-----------|-----------|----------|
| **Context Management** | [OpenViking](https://github.com/volcengine/OpenViking) | File-system paradigm for context. Three-tier loading (L0 index → L1 summary → L2 full) means you only pay for context you actually need. Sessions stay lean, credits stay low. |
| **Eval Layer** | [promptfoo](https://github.com/promptfoo/promptfoo) | Industry-standard prompt evaluation. Two-tier gating: deterministic checks (free) + LLM-graded rubrics via Haiku ($0.001/eval). Every output quality-checked before delivery. |
| **Simulation Skill** | [MiroFish](https://github.com/666ghj/MiroFish) | Multi-agent prediction framework for strategic foresight. When you need "what if" analysis, scenario modeling, or data-driven forecasting — not guessing. |
| **Frontend Standards** | [Impeccable](https://github.com/pbakaus/impeccable) | 21 enforceable frontend design skills. OKLCH color, 4pt spacing, modular type scales, WCAG AA, and an "AI Slop Test" that auto-fails generic-looking output. |
| **Role Catalog** | [agency-agents](https://github.com/msitarzewski/agency-agents) | 120+ battle-tested specialist role definitions across 12 divisions. Structured personas, not generic prompts. |
| **Orchestration** | [Claude Code](https://claude.ai/code) | Native integration. CLAUDE.md as orchestrator definition, skills system, persistent memory, session protocols. |

---

## Core Layers

<details>
<summary><strong>Layer 0: Context Management</strong> — The foundation that keeps everything efficient (OpenViking)</summary>

<br>

Based on [OpenViking](https://github.com/volcengine/OpenViking) — a context database designed specifically for AI agents. Instead of dumping everything into context and hoping for the best, aigod uses a **three-tier loading strategy** that treats context like a file system.

**The Problem It Solves:**
- Sessions bloat with irrelevant context → slower responses, higher costs
- Memory scattered across files with no retrieval strategy → agent loads everything or nothing
- Long conversations lose early context → quality degrades over time
- No visibility into what context informed a decision → debugging is guesswork

**Three-Tier Context Loading (L0/L1/L2):**

| Tier | What Loads | When | Token Cost |
|------|-----------|------|------------|
| **L0 — Index** | File names, descriptions, routing keywords | Every session start | ~200 tokens |
| **L1 — Summary** | Section headers, key decisions, metadata/frontmatter | When domain is classified | ~500-1000 tokens |
| **L2 — Full** | Complete file contents, detailed specs | Only when actively needed | Full file size |

**How This Saves Credits:**

```
Without tiered loading:
  Session start → load ALL memories + ALL roles + tracker + protocols
  = 50,000+ tokens consumed before any work begins

With tiered loading:
  Session start → load MEMORY.md index (L0) + tracker summary (L1)
  = ~500 tokens → classify task → load ONE role (L2) + relevant memories (L2)
  = ~3,000 tokens total, loaded incrementally
```

**Session Compression:**
As conversations grow, the system automatically:
1. Summarizes completed work (replace verbose tool outputs with structured summaries)
2. Archives resolved decisions (move to tracker log, release from active context)
3. Extracts persistent learnings (save to memory files, remove from conversation)
4. References instead of repeating (point to files/commits, don't re-quote them)

**Observable Context:**
Every decision cites what context informed it. If a memory or protocol influenced the approach, it's transparent — no black-box retrieval.

</details>

<details>
<summary><strong>Layer 1: Orchestrator</strong> — The brain that routes everything</summary>

<br>

Defined in `CLAUDE.md`, the orchestrator:

- Reads memory and tracker state on every session start
- Classifies incoming tasks by domain using keyword routing
- Selects the optimal specialist role from the catalog
- Loads relevant skills and constraint layers
- Manages retry logic (max 3 attempts) with eval feedback
- Logs every decision with structured entries
- Updates project state after every significant action

**Session start protocol:**
```
1. Read memory/MEMORY.md → load persistent context
2. Read tracker/tracker.md → check project state
3. Surface stuck/blocked items
4. Greet with current status
```

</details>

<details>
<summary><strong>Layer 2: Roles</strong> — 120+ specialists across 12 divisions</summary>

<br>

| Division | Count | Examples |
|----------|-------|---------|
| Engineering | 23 | Software Architect, Senior Dev, AI Engineer, DevOps, SRE |
| Design | 8 | UI Designer, UX Researcher, Brand Guardian |
| Marketing | 28+ | Growth Hacker, SEO Strategist, Content Creator |
| Sales | 8 | Outbound Strategist, Deal Closer, Sales Engineer |
| Product | 5 | Sprint Prioritizer, Feedback Synthesizer, PM |
| Project Management | 6 | Studio Producer, Project Shepherd, Jira Steward |
| Testing | 8 | Evidence Collector, Reality Checker, API Tester |
| Support | 6 | Analytics Reporter, Finance Tracker, Legal Compliance |
| Spatial Computing | 6 | XR Architect, visionOS Engineer |
| Specialized | 27 | MCP Builder, Document Generator, Workflow Architect |
| Game Dev | Varies | Engine Specialists, Level Design, Game AI |
| Paid Media | 7 | PPC, Programmatic, Paid Social |

Each role is a standalone `.md` file with structured sections:

```yaml
---
name: Software Architect
description: Designs system architecture, evaluates trade-offs
division: engineering
vibe: Thinks in systems, decides in trade-offs
---
```

**Identity → Core Mission → Critical Rules → Workflow → Decision Logic → Communication Style → Success Metrics**

The orchestrator loads **only the matched role** into context — never all 120+.

</details>

<details>
<summary><strong>Layer 3: Skills</strong> — Stateless capabilities invoked on demand</summary>

<br>

Roles define *how* the agent behaves. Skills define *what* it can do.

| Skill | Triggers | What It Does |
|-------|----------|-------------|
| **excalidraw** | "visualize", "diagram", "architecture" | Generates Excalidraw JSON diagrams with a render-validate loop |
| **mirofish** | "predict", "simulate", "scenario", "what if" | Multi-agent simulation for strategic foresight and data-driven predictions |
| **impeccable** | Automatic for all frontend output | Constraint layer enforcing 21 frontend design standards (not optional) |

A Software Architect role might invoke the excalidraw skill to diagram its output. A Product Manager might invoke mirofish to simulate market scenarios. Any role touching frontend triggers impeccable automatically.

**Adding custom skills:**
```
.claude/skills/your-skill/
├── SKILL.md          ← Frontmatter + methodology
└── references/       ← Supporting assets
```

</details>

<details>
<summary><strong>Layer 4: Eval Gate</strong> — Quality control on every output</summary>

<br>

Powered by [promptfoo](https://github.com/promptfoo/promptfoo). Two tiers:

**Tier 1 — Deterministic (free, always runs):**
```yaml
- type: not-contains        # No hallucinated URLs
  value: "example.com"
- type: javascript           # Output is not empty
  value: "output.length > 0"
- type: not-contains        # No leaked system prompts
  value: "CLAUDE.md"
```

**Tier 2 — LLM-Graded (~$0.001/eval via Haiku):**
```yaml
- type: llm-rubric
  value: "The response provides specific, actionable guidance
          rather than generic or vague advice."
- type: llm-rubric
  value: "The response addresses exactly what was asked —
          no more, no less. No over-engineering."
```

**Composite scoring:**
```
quality * 0.6 + relevance * 0.3 + cost_efficiency * 0.1
```

**Control flow:** PASS → deliver | FAIL → retry with feedback (max 3) → escalate to user

Three assertion sets included: `quality.yaml`, `safety.yaml`, `domain.yaml` (customizable).

</details>

<details>
<summary><strong>Layer 5: Memory</strong> — Persistent knowledge that survives sessions</summary>

<br>

| Type | Purpose | Example |
|------|---------|---------|
| **user** | Who you are, preferences, expertise | "Senior Go engineer, new to React, prefers terse responses" |
| **feedback** | Corrections and confirmed approaches | "Don't mock the database — got burned last quarter" |
| **project** | Ongoing work context and decisions | "Auth rewrite for SOC2 compliance, deadline April 15" |
| **reference** | Pointers to external systems | "Bugs in Linear project PLATFORM, dashboards at grafana.internal" |
| **protocols** | Evolved rules from past interactions | "Always confirm before touching infrastructure" |

Each memory is a `.md` file with structured frontmatter, indexed in `MEMORY.md` (always loaded, < 200 lines). The agent learns from corrections and **never repeats the same mistake twice**.

</details>

<details>
<summary><strong>Layer 6: Frontend Constraints</strong> — The Impeccable standard</summary>

<br>

Based on [Impeccable](https://github.com/pbakaus/impeccable) — 21 enforceable frontend design skills. This is a **mandatory constraint**, not an optional skill. Any agent output touching HTML/CSS/JS passes through:

```
/audit → /normalize → /harden → /polish → /critique
```

**The 7 Standards:**

| Standard | Key Rules |
|----------|-----------|
| Typography | No Inter/Roboto defaults, modular type scale, 16px min body |
| Color | OKLCH color space, tinted neutrals, 60-30-10 ratio |
| Spatial | 4pt base, `gap` over margin, container queries |
| Motion | Meaningful only, `prefers-reduced-motion`, no bounce easing |
| Interaction | 44px touch targets, visible focus indicators |
| Responsive | Mobile-first, fluid `clamp()`, logical CSS properties, i18n budget |
| Accessibility | WCAG AA minimum (4.5:1 body, 3:1 UI), semantic HTML |

**Auto-fail triggers:** Glassmorphism, gradient text, nested cards, pure black on white, z-index > 100, `!important` without justification.

**The AI Slop Test:** "Would someone guess AI generated this?" If yes → fail.

</details>

---

## Quick Start

Pick the setup that fits how you work:

### Prerequisites

- [Claude Code](https://claude.ai/code) (CLI) — for Option A and B
- [Claude Pro/Team](https://claude.ai) — for Option C (Projects)
- Node.js 18+ (for promptfoo evals)
- Git

---

### Option A: Local Repo + Cloud Backup (Recommended)

Your own personal agent repo, backed up to GitHub/GitLab for sync across machines.

```bash
# 1. Clone to your local workspace
git clone https://github.com/dnsatgit/aigod.git my-agent
cd my-agent

# 2. Make it YOUR repo (disconnect from aigod upstream)
rm -rf .git
git init
git add -A
git commit -m "Initialize my agent from aigod framework"

# 3. Push to your own private repo for cloud backup
git remote add origin https://github.com/YOUR_USERNAME/my-agent.git
git push -u origin main

# 4. Install eval dependencies
npm install

# 5. Customize (see table below), then run
claude
```

Your agent now lives in a private repo. Push regularly — your memory, protocols, and tracker are version-controlled. Roll back mistakes. Sync across devices. Your agent's brain is backed up.

---

### Option B: Claude Code Session (Quick & Direct)

Open any existing project folder with Claude Code and point it at aigod.

```bash
# 1. Clone aigod INTO your existing project as a subfolder
cd /path/to/your/project
git clone https://github.com/dnsatgit/aigod.git .aigod

# 2. Copy the orchestrator into your project root
cp .aigod/CLAUDE.md ./CLAUDE.md

# 3. Symlink or copy the framework pieces you need
cp -r .aigod/roles ./roles
cp -r .aigod/evals ./evals
cp -r .aigod/memory ./memory
cp -r .aigod/tracker ./tracker
cp -r .aigod/.claude ./.claude

# 4. Install eval dependencies
npm install --prefix .aigod

# 5. Customize, then open with Claude Code
claude
```

Claude Code reads `CLAUDE.md` from the project root automatically. Your agent lives alongside your code — context about your actual codebase is immediate.

---

### Option C: Claude Projects (Web UI)

Use aigod as the system prompt and knowledge base for a Claude Project on claude.ai.

1. **Create a new Project** at [claude.ai](https://claude.ai)
2. **Set the Project Instructions** — paste the contents of `CLAUDE.md` into the project's custom instructions
3. **Upload knowledge files:**
   - `roles/index.yaml` — so the agent knows what roles are available
   - Any specific role `.md` files you want active
   - `memory/protocols.md` — your established rules
   - `docs/domain/` contents — your domain specs
4. **Seed the conversation** — tell the agent who you are, what you're working on, and your preferences. It will save these as memory for the project.

> **Note:** Claude Projects doesn't have file system access, so evals (promptfoo), skills (excalidraw), and the tracker won't run automatically. You get the orchestrator brain, role routing, and memory — but without the automation layer. For the full experience, use Option A or B.

---

### After Setup: Customize

| Step | What | Where |
|------|------|-------|
| Add your specs | Company docs, conventions, architecture | `docs/domain/` |
| Pick your roles | Enable relevant divisions | `roles/index.yaml` |
| Set your quality bar | Domain-specific eval assertions | `evals/assertions/domain.yaml` |
| Seed memory | Who you are, project context, preferences | `memory/` |
| Add skills | Domain-specific capabilities (optional) | `.claude/skills/` |

See [CUSTOMIZE.md](CUSTOMIZE.md) for the full walkthrough.

### Verify It Works

```bash
# Open with Claude Code
claude

# The agent should:
# 1. Read memory/MEMORY.md (L0 context index)
# 2. Read tracker/tracker.md (project state)
# 3. Greet you with current status
# 4. Ask what you're working on (if first session)
```

```bash
# Run evals manually (Option A/B only)
npm run eval
npm run eval:view
```

---

## Domain Examples

<details>
<summary><strong>Software Engineering Team</strong></summary>

```yaml
# roles/index.yaml
divisions:
  engineering: { enabled: true }
  testing: { enabled: true }
  product: { enabled: true }
  project-management: { enabled: true }
```

```markdown
<!-- memory/user_team.md -->
---
name: user_team
description: Backend-heavy team, Go + PostgreSQL, microservices architecture
type: user
---
Full-stack team of 6. Primary stack: Go, PostgreSQL, gRPC, React.
Monorepo. CI via GitHub Actions. Deploy to AWS ECS.
```

</details>

<details>
<summary><strong>Marketing Agency</strong></summary>

```yaml
# roles/index.yaml
divisions:
  marketing: { enabled: true }
  design: { enabled: true }
  sales: { enabled: true }
  paid-media: { enabled: true }
```

</details>

<details>
<summary><strong>Solo Founder</strong></summary>

```yaml
# roles/index.yaml
divisions:
  engineering: { enabled: true, roles: [software-architect, senior-dev] }
  product: { enabled: true, roles: [sprint-prioritizer] }
  marketing: { enabled: true, roles: [growth-hacker] }
  design: { enabled: true, roles: [ui-designer] }
```

</details>

---

## Directory Structure

```
aigod/
├── CLAUDE.md                      # Master orchestrator brain
├── CUSTOMIZE.md                   # Your setup guide
├── package.json
│
├── .claude/
│   ├── commands/                  # Custom slash commands
│   └── skills/
│       ├── excalidraw/            # Diagramming
│       ├── mirofish/              # Predictive simulation
│       └── impeccable/            # Frontend constraint layer
│
├── roles/
│   ├── index.yaml                 # Routing config
│   ├── TEMPLATE.md                # Create your own roles
│   ├── engineering/               # 23 roles
│   ├── design/                    # 8 roles
│   ├── marketing/                 # 28+ roles
│   ├── sales/                     # 8 roles
│   ├── product/                   # 5 roles
│   ├── project-management/        # 6 roles
│   ├── testing/                   # 8 roles
│   ├── support/                   # 6 roles
│   └── specialized/               # 27 roles
│
├── evals/
│   ├── promptfooconfig.yaml       # Global eval config
│   └── assertions/                # quality, safety, domain
│
├── memory/                        # Persistent cross-session knowledge
├── tracker/                       # Single source of truth
├── docs/                          # Architecture + your domain specs
└── scripts/                       # Setup automation
```

---

## How It Learns

```mermaid
flowchart LR
    A[User corrects agent] --> B[Agent saves feedback memory]
    B --> C[Feedback becomes protocol]
    C --> D[Protocol loaded on future sessions]
    D --> E[Mistake never repeated]

    style A fill:#161b22,stroke:#f78166,color:#c9d1d9
    style B fill:#161b22,stroke:#58a6ff,color:#c9d1d9
    style C fill:#161b22,stroke:#bc8cff,color:#c9d1d9
    style D fill:#161b22,stroke:#3fb950,color:#c9d1d9
    style E fill:#161b22,stroke:#3fb950,color:#c9d1d9
```

**Example:**
1. You say: *"Don't mock the database in these tests — we got burned last quarter"*
2. aigod saves a feedback memory with the rule AND the reason
3. Next session, it loads that memory and applies the rule
4. It never suggests mocking the database again

---

## Cost Efficiency

aigod is designed to minimize credit burn at every layer:

### Context Loading (OpenViking tiered strategy)

| Strategy | Tokens Loaded | Savings |
|----------|--------------|---------|
| Naive: load all memories + all roles | ~50,000+ tokens/session | — |
| aigod: L0 index → L1 scan → L2 targeted | ~3,000 tokens/session | **~94% reduction** |
| Session compression (long conversations) | Ongoing reduction | Keeps context lean over time |

### Eval Layer

| What | Model | Cost | When |
|------|-------|------|------|
| Deterministic checks | None (regex, contains) | **$0.00** | Every output |
| LLM-graded rubrics | claude-haiku-4-5 | **~$0.001** | Non-trivial outputs |
| Your main agent | claude-sonnet/opus | Your plan | Task execution |

The grader doesn't need to be smart — it just evaluates against a rubric. Haiku handles this at 1/60th the cost of Opus.

### The Compound Effect

Tiered context loading + cheap eval grading + session compression + persistent memory (no re-explanation) = **significantly lower per-session cost** while maintaining higher output quality. The framework pays for itself by not wasting tokens on context you don't need.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). We welcome:

- New specialist roles
- Custom skills
- Eval assertion sets
- Domain configuration examples
- Bug fixes and improvements

---

## License

MIT — see [LICENSE](LICENSE).

---

<p align="center">
  <strong>Built for the age of AI agents.</strong><br>
  <sub>Clone it. Feed it your specs. Watch it work.</sub>
</p>
