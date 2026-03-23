# Customizing aigod for Your Domain

This guide walks you through turning the generic aigod framework into your domain-specific master agent.

## Step 1: Add Your Domain Specs

Place your company/project documentation in `docs/domain/`:

```
docs/domain/
├── overview.md          # What your company/project does
├── glossary.md          # Internal terminology
├── conventions.md       # Coding standards, naming conventions, etc.
├── architecture.md      # Your system architecture
├── constraints/         # Domain-specific constraints
│   └── compliance.md    # Regulatory requirements, etc.
└── ...                  # Any other relevant docs
```

The orchestrator will reference these when making decisions. The more context you provide, the better the agent understands your domain.

## Step 2: Configure Roles

Edit `roles/index.yaml` to enable only the divisions relevant to your work.

**Software team:**
```yaml
divisions:
  engineering: { enabled: true }
  testing: { enabled: true }
  product: { enabled: true }
  project-management: { enabled: true }
```

**Marketing agency:**
```yaml
divisions:
  marketing: { enabled: true }
  design: { enabled: true }
  sales: { enabled: true }
```

**Solo founder:**
```yaml
divisions:
  engineering: { enabled: true, roles: [software-architect, senior-dev] }
  product: { enabled: true, roles: [sprint-prioritizer] }
  marketing: { enabled: true, roles: [growth-hacker] }
```

### Adding Custom Roles

1. Copy `roles/TEMPLATE.md` to the appropriate division
2. Fill in the role definition
3. Add it to `roles/index.yaml`

## Step 3: Define Your Quality Bar

Edit `evals/assertions/domain.yaml` with assertions specific to your project:

```yaml
tests:
  - description: "Uses our API conventions"
    assert:
      - type: llm-rubric
        value: "API endpoints use snake_case, return envelope format { data, meta }..."
```

Adjust the scoring weights in `evals/promptfooconfig.yaml` if needed.

## Step 4: Seed Memory

Create initial memory files in `memory/` to give the agent context about:

**Who you are** (`memory/user_role.md`):
```markdown
---
name: user_role
description: User is a backend engineer at Acme Corp, expert in Go and PostgreSQL
type: user
---

Senior backend engineer. 8 years experience. Primary stack: Go, PostgreSQL, gRPC.
New to the frontend side of the codebase.
```

**Project context** (`memory/project_current.md`):
```markdown
---
name: project_current
description: Currently rebuilding auth service for SOC2 compliance, deadline April 15
type: project
---

Auth service rebuild for SOC2 compliance. Deadline: 2026-04-15.
**Why:** Audit finding from Q1 — session tokens stored in non-compliant format.
**How to apply:** Prioritize compliance over ergonomics in auth-related decisions.
```

**External references** (`memory/reference_systems.md`):
```markdown
---
name: reference_systems
description: Key external systems and where to find things
type: reference
---

- Bugs: Linear project "PLATFORM"
- Docs: Confluence space "ENG"
- Dashboards: Grafana at grafana.internal/d/api-latency
- CI: GitHub Actions, main branch auto-deploys to staging
```

Update `memory/MEMORY.md` index after adding files.

## Step 5: Add Domain Skills (Optional)

If your domain has unique capabilities, create custom skills:

```
.claude/skills/your-skill/
├── SKILL.md          # Name, description, triggers, methodology
└── references/       # Templates, schemas, examples
```

Register the skill in `CLAUDE.md` under the Skills table.

## Step 6: Verify

1. Open the project with Claude Code
2. The orchestrator should read memory and tracker on startup
3. Give it a task in your domain
4. Check that it routes to the correct role
5. Verify eval gates are running

```bash
# Run eval suite manually
npm run eval

# View results in browser
npm run eval:view
```

## Tips

- **Start small.** Enable 3-5 roles, not all 120+. Add more as needed.
- **Write good domain specs.** The agent is only as good as the context you give it.
- **Tune evals iteratively.** Start with the defaults, then add domain assertions as you see gaps.
- **Let protocols evolve.** The agent learns from corrections — give feedback and it will improve.
- **Keep memory lean.** Remove outdated memories. Quality over quantity.
