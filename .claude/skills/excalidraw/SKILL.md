---
name: excalidraw
description: Generates Excalidraw JSON diagrams for visualizing architectures, workflows, and concepts
triggers: [visualize, diagram, architecture, flow, chart, map, sketch]
---

# Excalidraw Diagram Skill

Generate valid Excalidraw JSON files that render as clear, professional diagrams.

## When to Invoke

- User asks to "visualize", "diagram", or "sketch" something
- Architecture decisions need visual representation
- Workflows or processes need mapping
- Any concept benefits from a visual explanation

## Methodology

1. **Plan the layout** — Identify nodes, edges, and groupings before generating JSON
2. **Generate JSON** — Produce valid Excalidraw JSON with proper element positioning
3. **Validate** — Ensure all elements are connected, labels are readable, and layout is clean
4. **Iterate** — If the diagram is too complex, break it into multiple diagrams

## Output Format

Write a `.excalidraw` file (JSON format) to the project directory.

## Layout Rules

- Use consistent spacing (minimum 40px between elements)
- Group related elements visually
- Use arrows with labels for relationships
- Keep text concise — labels, not paragraphs
- Use color sparingly: max 3-4 colors to indicate categories
- Flow direction: top-to-bottom or left-to-right (never mixed)

## Element Palette

- **Rectangles** — components, services, modules
- **Diamonds** — decisions, conditions
- **Ellipses** — start/end points, external systems
- **Arrows** — data flow, dependencies, relationships
- **Text** — labels, annotations

## References

See `references/` for color palettes and style templates.
