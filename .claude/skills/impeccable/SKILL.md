---
name: impeccable
description: Mandatory constraint layer enforcing 21 frontend design standards on all UI output
triggers: [auto — applied to ALL frontend output]
constraint: true
---

# Impeccable Frontend Constraint Layer

This is NOT an optional skill — it is a **mandatory constraint** applied to all frontend output. Any sub-agent or skill producing HTML, CSS, or JavaScript UI code must comply.

Based on: https://github.com/pbakaus/impeccable

## Enforcement

When any agent produces frontend code, this constraint layer is automatically loaded. The output must pass the audit pipeline:

```
/audit → /normalize → /harden → /polish → /critique
```

## The 7 Standards

### 1. Typography
- No Inter, Roboto, or system-ui defaults without explicit justification
- Modular type scale (e.g., 1.25 ratio)
- 16px minimum body text
- Line height: 1.4-1.6 for body, 1.1-1.2 for headings
- Max line length: 65-75 characters

### 2. Color (OKLCH)
- Use OKLCH color space, not hex/rgb/hsl
- Tinted neutrals — no pure gray (#808080)
- 60-30-10 color ratio (dominant-secondary-accent)
- Semantic color tokens (not raw values in components)

### 3. Spatial System (4pt base)
- All spacing values are multiples of 4px
- Use `gap` over `margin` for component spacing
- Container queries over media queries where supported
- Consistent padding scale

### 4. Motion
- Meaningful transitions only — no decorative animation
- Respect `prefers-reduced-motion`
- Duration: 150-300ms for micro-interactions, 300-500ms for layout shifts
- No bounce easing, no elastic effects

### 5. Interaction
- 44px minimum touch targets
- Visible focus indicators (not just outline: none)
- Hover states that also work on touch
- Loading states for async operations

### 6. Responsive
- Mobile-first approach
- Fluid typography with clamp()
- Logical CSS properties (margin-inline, padding-block)
- i18n budget: 30-40% extra space for translated text

### 7. Accessibility
- WCAG AA minimum: 4.5:1 contrast for body text, 3:1 for large text and UI
- Semantic HTML elements
- ARIA labels only when semantic HTML is insufficient
- Screen reader testing checklist

## Anti-Patterns (Auto-Fail)

Any of these in the output = automatic failure:

- Glassmorphism / frosted glass effects
- Gradient text
- Nested cards (card inside card)
- Bounce/elastic easing
- Pure black (#000) on pure white (#fff)
- z-index values above 100 without justification
- !important without justification
- Inline styles for layout

## AI Slop Test

Final check: "Would someone guess AI generated this?" If yes → fail. The output must look intentionally designed, not generically generated.

## References

See `references/` for:
- OKLCH color palettes
- Type scale calculators
- Spacing token sets
- Component audit checklists
