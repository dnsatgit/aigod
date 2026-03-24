---
name: excalidraw-diagram
description: Create Excalidraw diagram JSON files that make visual arguments. Use when the user wants to visualize workflows, architectures, or concepts.
---

# Excalidraw Diagram Creator

Generate `.excalidraw` JSON files that **argue visually**, not just display information.

**Setup:** If the user asks you to set up this skill (renderer, dependencies, etc.), see `README.md` for instructions.

## Customization

**All colors and brand-specific styles live in one file:** `references/color-palette.md`. Read it before generating any diagram and use it as the single source of truth for all color choices — shape fills, strokes, text colors, evidence artifact backgrounds, everything.

To make this skill produce diagrams in your own brand style, edit `color-palette.md`. Everything else in this file is universal design methodology and Excalidraw best practices.

---

## Core Philosophy

**Diagrams should ARGUE, not DISPLAY.**

A diagram isn't formatted text. It's a visual argument that shows relationships, causality, and flow that words alone can't express. The shape should BE the meaning.

**The Isomorphism Test**: If you removed all text, would the structure alone communicate the concept? If not, redesign.

**The Education Test**: Could someone learn something concrete from this diagram, or does it just label boxes? A good diagram teaches—it shows actual formats, real event names, concrete examples.

---

## Depth Assessment (Do This First)

Before designing, determine what level of detail this diagram needs:

### Simple/Conceptual Diagrams
Use abstract shapes when:
- Explaining a mental model or philosophy
- The audience doesn't need technical specifics
- The concept IS the abstraction (e.g., "separation of concerns")

### Comprehensive/Technical Diagrams
Use concrete examples when:
- Diagramming a real system, protocol, or architecture
- The diagram will be used to teach or explain (e.g., YouTube video)
- The audience needs to understand what things actually look like
- You're showing how multiple technologies integrate

**For technical diagrams, you MUST include evidence artifacts** (see below).

---

## Research Mandate (For Technical Diagrams)

**Before drawing anything technical, research the actual specifications.**

If you're diagramming a protocol, API, or framework:
1. Look up the actual JSON/data formats
2. Find the real event names, method names, or API endpoints
3. Understand how the pieces actually connect
4. Use real terminology, not generic placeholders

Bad: "Protocol" → "Frontend"
Good: "AG-UI streams events (RUN_STARTED, STATE_DELTA, A2UI_UPDATE)" → "CopilotKit renders via createA2UIMessageRenderer()"

**Research makes diagrams accurate AND educational.**

---

## Evidence Artifacts

Evidence artifacts are concrete examples that prove your diagram is accurate and help viewers learn. Include them in technical diagrams.

**Types of evidence artifacts** (choose what's relevant to your diagram):

| Artifact Type | When to Use | How to Render |
|---------------|-------------|---------------|
| **Code snippets** | APIs, integrations, implementation details | Dark rectangle + syntax-colored text (see color palette for evidence artifact colors) |
| **Data/JSON examples** | Data formats, schemas, payloads | Dark rectangle + colored text (see color palette) |
| **Event/step sequences** | Protocols, workflows, lifecycles | Timeline pattern (line + dots + labels) |
| **UI mockups** | Showing actual output/results | Nested rectangles mimicking real UI |
| **Real input content** | Showing what goes IN to a system | Rectangle with sample content visible |
| **API/method names** | Real function calls, endpoints | Use actual names from docs, not placeholders |

The key principle: **show what things actually look like**, not just what they're called.

---

## Multi-Zoom Architecture

Comprehensive diagrams operate at multiple zoom levels simultaneously.

### Level 1: Summary Flow
A simplified overview showing the full pipeline or process at a glance.

### Level 2: Section Boundaries
Labeled regions that group related components.

### Level 3: Detail Inside Sections
Evidence artifacts, code snippets, and concrete examples within each section.

**For comprehensive diagrams, aim to include all three levels.**

---

## Container vs. Free-Floating Text

**Not every piece of text needs a shape around it.** Default to free-floating text. Add containers only when they serve a purpose.

| Use a Container When... | Use Free-Floating Text When... |
|------------------------|-------------------------------|
| It's the focal point of a section | It's a label or description |
| It needs visual grouping with other elements | It's supporting detail or metadata |
| Arrows need to connect to it | It describes something nearby |
| The shape itself carries meaning (decision diamond, etc.) | Typography alone creates sufficient hierarchy |

**The container test**: For each boxed element, ask "Would this work as free-floating text?" If yes, remove the container.

---

## Design Process (Do This BEFORE Generating JSON)

### Step 0: Assess Depth Required
Before anything else, determine if this needs to be:
- **Simple/Conceptual**: Abstract shapes, labels, relationships
- **Comprehensive/Technical**: Concrete examples, code snippets, real data

### Step 1: Understand Deeply
Read the content. For each concept, ask:
- What does this concept **DO**?
- What relationships exist between concepts?
- What's the core transformation or flow?

### Step 2: Map Concepts to Patterns

| If the concept... | Use this pattern |
|-------------------|------------------|
| Spawns multiple outputs | **Fan-out** (radial arrows from center) |
| Combines inputs into one | **Convergence** (funnel, arrows merging) |
| Has hierarchy/nesting | **Tree** (lines + free-floating text) |
| Is a sequence of steps | **Timeline** (line + dots + free-floating labels) |
| Loops or improves continuously | **Spiral/Cycle** (arrow returning to start) |
| Is an abstract state or context | **Cloud** (overlapping ellipses) |
| Transforms input to output | **Assembly line** (before → process → after) |
| Compares two things | **Side-by-side** (parallel with contrast) |
| Separates into phases | **Gap/Break** (visual separation between sections) |

### Step 3: Ensure Variety
For multi-concept diagrams: **each major concept must use a different visual pattern**.

### Step 4: Sketch the Flow
Before JSON, mentally trace how the eye moves through the diagram.

### Step 5: Generate JSON
Only now create the Excalidraw elements. **See below for how to handle large diagrams.**

### Step 6: Render & Validate (MANDATORY)
After generating the JSON, you MUST run the render-view-fix loop until the diagram looks right.

---

## Large / Comprehensive Diagram Strategy

**For comprehensive or technical diagrams, you MUST build the JSON one section at a time.** Do NOT attempt to generate the entire file in a single pass.

### The Section-by-Section Workflow

**Phase 1: Build each section**

1. **Create the base file** with the JSON wrapper and the first section of elements.
2. **Add one section per edit.** Each section gets its own dedicated pass.
3. **Use descriptive string IDs** (e.g., `"trigger_rect"`, `"arrow_fan_left"`).
4. **Namespace seeds by section** (e.g., section 1 uses 100xxx, section 2 uses 200xxx).
5. **Update cross-section bindings** as you go.

**Phase 2: Review the whole**

After all sections are in place, check cross-section arrows, overall spacing, and binding correctness.

**Phase 3: Render & validate**

Run the render-view-fix loop from the Render & Validate section.

### What NOT to Do

- **Don't generate the entire diagram in one response.**
- **Don't use a coding agent** to generate the JSON.
- **Don't write a Python generator script.**

---

## Visual Pattern Library

### Fan-Out (One-to-Many)
Central element with arrows radiating to multiple targets.

### Convergence (Many-to-One)
Multiple inputs merging through arrows to single output.

### Tree (Hierarchy)
Parent-child branching with connecting lines and free-floating text (no boxes needed).

### Spiral/Cycle (Continuous Loop)
Elements in sequence with arrow returning to start.

### Cloud (Abstract State)
Overlapping ellipses with varied sizes.

### Assembly Line (Transformation)
Input → Process Box → Output with clear before/after.

### Side-by-Side (Comparison)
Two parallel structures with visual contrast.

### Gap/Break (Separation)
Visual whitespace or barrier between sections.

### Lines as Structure
Use lines (type: `line`, not arrows) as primary structural elements:
- **Timelines**: Vertical or horizontal line with small dots (10-20px ellipses) at intervals
- **Tree structures**: Vertical trunk line + horizontal branch lines
- **Dividers**: Thin dashed lines to separate sections

---

## Shape Meaning

| Concept Type | Shape | Why |
|--------------|-------|-----|
| Labels, descriptions, details | **none** (free-floating text) | Typography creates hierarchy |
| Section titles, annotations | **none** (free-floating text) | Font size/weight is enough |
| Markers on a timeline | small `ellipse` (10-20px) | Visual anchor, not container |
| Start, trigger, input | `ellipse` | Soft, origin-like |
| End, output, result | `ellipse` | Completion, destination |
| Decision, condition | `diamond` | Classic decision symbol |
| Process, action, step | `rectangle` | Contained action |
| Abstract state, context | overlapping `ellipse` | Fuzzy, cloud-like |
| Hierarchy node | lines + text (no boxes) | Structure through lines |

**Rule**: Default to no container. Add shapes only when they carry meaning. Aim for <30% of text elements to be inside containers.

---

## Color as Meaning

Colors encode information, not decoration. Every color choice should come from `references/color-palette.md`.

**Do not invent new colors.**

---

## Modern Aesthetics

- `roughness: 0` — Clean, crisp edges. Default for professional diagrams.
- `strokeWidth: 2` — Standard for shapes and primary arrows.
- `opacity: 100` — Always. Use color, size, and stroke width for hierarchy instead.
- Small dots (10-20px ellipses) for timeline markers and visual anchors.

---

## Layout Principles

### Hierarchy Through Scale
- **Hero**: 300×150 - visual anchor, most important
- **Primary**: 180×90
- **Secondary**: 120×60
- **Small**: 60×40

### Whitespace = Importance
The most important element has the most empty space around it (200px+).

### Flow Direction
Typically left→right or top→bottom for sequences, radial for hub-and-spoke.

### Connections Required
Position alone doesn't show relationships. If A relates to B, there must be an arrow.

---

## Text Rules

**CRITICAL**: The JSON `text` property contains ONLY readable words.

Settings: `fontSize: 16`, `fontFamily: 3`, `textAlign: "center"`, `verticalAlign: "middle"`

---

## JSON Structure

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [...],
  "appState": {
    "viewBackgroundColor": "#ffffff",
    "gridSize": 20
  },
  "files": {}
}
```

## Element Templates

See `references/element-templates.md` for copy-paste JSON templates for each element type.

---

## Render & Validate (MANDATORY)

You cannot judge a diagram from JSON alone. After generating or editing the Excalidraw JSON, you MUST render it to PNG, view the image, and fix what you see — in a loop until it's right.

### How to Render

```bash
cd .claude/skills/excalidraw/references && uv run python render_excalidraw.py <path-to-file.excalidraw>
```

This outputs a PNG next to the `.excalidraw` file. Then use the **Read tool** on the PNG to actually view it.

### The Loop

1. **Render & View** — Run the render script, then Read the PNG.
2. **Audit against your original vision** — Does visual structure match conceptual structure?
3. **Check for visual defects** — Clipping, overlaps, bad arrow routing, unreadable text.
4. **Fix** — Edit JSON coordinates, sizes, arrow points.
5. **Re-render & re-view** — Repeat until diagram is clean.
6. **Repeat** — Typically 2-4 iterations.

### When to Stop

- The rendered diagram matches the conceptual design
- No text is clipped, overlapping, or unreadable
- Arrows route cleanly and connect to the right elements
- Spacing is consistent and the composition is balanced

### First-Time Setup
```bash
cd .claude/skills/excalidraw/references
uv sync
uv run playwright install chromium
```

---

## Quality Checklist

### Depth & Evidence
1. Research done: actual specs, formats, event names used?
2. Evidence artifacts present in technical diagrams?
3. Multi-zoom: summary flow + section boundaries + detail?
4. Concrete over abstract: real content, not just labeled boxes?

### Conceptual
5. Isomorphism: does visual structure mirror concept behavior?
6. Argument: does diagram SHOW something text alone couldn't?
7. Variety: each major concept uses a different visual pattern?
8. No uniform containers: avoided card grids and equal boxes?

### Container Discipline
9. Minimal containers: could boxed elements work as free-floating text?
10. Lines as structure: tree/timeline patterns using lines + text?
11. Typography hierarchy: font size and color creating visual hierarchy?

### Technical
12. Text clean: `text` contains only readable words
13. Font: `fontFamily: 3`
14. Roughness: `roughness: 0` for clean/modern
15. Opacity: `opacity: 100` for all elements

### Visual Validation (Render Required)
16. Rendered to PNG and visually inspected
17. No text overflow from containers
18. No overlapping elements
19. Even spacing between similar elements
20. Arrows connect to intended elements
21. Text legible at export size
22. Balanced composition
