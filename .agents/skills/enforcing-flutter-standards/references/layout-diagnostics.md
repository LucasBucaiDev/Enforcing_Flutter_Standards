# Flutter layout diagnostics recipe

<!-- provenance: flutter-layout-constraints, flutter-inspector, project-policy-layout-diagnostics -->

Use this recipe for a concrete overflow, unbounded constraint, clipping, sizing,
or viewport-dependent layout failure.

## Activate

Require the failing widget, state, target dimensions, orientation, text scale,
locale, and error or render evidence. Preserve the existing design system and
responsive conventions; do not redesign the whole screen to repair one boundary.

## Steps

1. Reproduce the smallest failing tree at the exact constraint and content case.
2. Read the first framework error and identify the nearest owning render object,
   such as the reported `RenderFlex`, before editing widgets.
3. Apply Flutter's model: Constraints go down. Sizes go up. Parent sets position.
   Trace bounded, loose, tight, and unbounded values through the relevant parents.
4. Use the Flutter inspector to inspect `constraints` and `size`; enable layout
   guidelines only as temporary diagnostic evidence, never production debug code.
   When collecting that evidence, apply `runtime-inspection.md` for capability
   discovery, the runtime record, and fallback.
5. Fix the closest owner of the invalid negotiation. Choose reflow, scroll,
   flex, bounds, or truncation only when the content and target contract support it.
6. Add or update the smallest widget test when the failure is behaviorally
   reproducible; otherwise capture a scoped render comparison.

## Common failures

- Wrapping blindly with `Expanded`, `Flexible`, or a scroll view moves the error.
- A flex child receives an unbounded main-axis constraint.
- A test uses a default surface size that never reproduces the target viewport.
- Short English copy hides an overflow caused by localization or text scaling.
- Debug paint or inspector-only switches remain in production code.

## Verify

Re-run the exact failing state and assert no layout exception. Check the nearest
compact and expanded supported constraints, long localized copy, and applicable
text scale. Record dimensions, locale, state, command or render, and result; do
not claim the complete UI is responsive from one corrected overflow.
