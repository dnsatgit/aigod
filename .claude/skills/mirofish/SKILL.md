---
name: mirofish
description: Multi-agent simulation engine for predictive analytics, scenario modeling, and strategic foresight
triggers: [predict, simulate, scenario, forecast, what if, model, projection]
---

# MiroFish Simulation Skill

Leverage the MiroFish multi-agent prediction framework for data-driven strategic foresight.

## When to Invoke

- User asks "what if" or "what would happen if" questions
- Scenario modeling or forecasting is needed
- Strategic decisions require simulation of outcomes
- Data-driven prediction beyond simple extrapolation

## Overview

MiroFish uses a multi-agent architecture where specialized agents collaborate on prediction tasks:
- **Data agents** gather and preprocess input data
- **Model agents** run parallel simulations with different assumptions
- **Synthesis agents** aggregate results and identify consensus/divergence

## Methodology

1. **Define the question** — What specific outcome are we trying to predict or model?
2. **Identify variables** — What inputs, assumptions, and constraints define the scenario?
3. **Configure simulation** — Set up agent roles, data sources, and model parameters
4. **Run simulations** — Execute parallel scenarios with varying assumptions
5. **Synthesize results** — Aggregate findings, identify patterns, flag uncertainties
6. **Report** — Deliver structured prediction report with confidence intervals

## Output Format

```markdown
## Prediction Report: [Question]

### Scenarios Modeled
- Scenario A: [description] — [probability] — [outcome]
- Scenario B: [description] — [probability] — [outcome]

### Key Variables
| Variable | Base Case | Optimistic | Pessimistic |
|----------|-----------|------------|-------------|

### Recommendation
[Action to take based on simulation results]

### Confidence & Caveats
[What we're confident about, what we're not, and why]
```

## Setup

MiroFish can run as:
- **Inline mode** — Lightweight simulation within the current agent context
- **Service mode** — Full Docker-based service for heavy simulations

For service mode setup, see: https://github.com/666ghj/MiroFish
