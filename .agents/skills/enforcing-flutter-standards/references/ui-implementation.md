# Flutter UI implementation contract

<!-- provenance: flutter-adaptive-responsive, flutter-accessibility, project-policy-ui-implementation -->

Apply repository and directory instructions first. Use this contract for any
Flutter task that consumes Figma, screenshots, mockups, prototypes, implemented
themes or components, or supplied assets.

## Contents

- Visual sources and readiness
- Design audit and gap protocol
- Implementation and state-driven interaction
- Responsive and adaptive behavior
- Icons, accessibility, tests, and visual comparison

## Visual sources are not complete product specifications

Inspect the available sources before writing UI code, in this order:

1. design file or design link;
2. screenshots or mockups;
3. an existing prototype;
4. the implemented theme, design system, components, and assets.

Treat Figma and screenshots as visual evidence, not as complete specifications
of product behavior, navigation, architecture, accessibility, or responsive
behavior. Reconcile the sources with repository conventions and turn the
available evidence into an implementable contract. When evidence is missing or
conflicting for a decision that can materially change the result, report the
gap and obtain the decision before implementing the affected scope.

## Design readiness checklist

Before implementation, require and record:

- a screen and component inventory;
- each component's anatomy, properties, and variants;
- initial, loading, empty, content, error, disabled, and success states when
  applicable;
- transitions, back behavior, scroll, focus, keyboard, and validation
  behavior;
- target dimensions and platforms;
- color, typography, spacing, radius, and elevation tokens;
- an exact SVG, image, and font manifest.

The contract is not ready when a missing decision can materially change the
user experience or implementation boundary. Review those decisions with the
user before proceeding with the dependent scope.

## Design audit

Before reproducing a visual source, check whether it:

- conflicts with Material guidance or required platform conventions;
- omits necessary states, interactions, feedback, or navigation behavior;
- fails to account for long text, text scaling, localization, variable
  content, orientation, or supported dimensions;
- creates contrast, semantics, focus, keyboard, or touch-target problems;
- gives visually identical components different behavior;
- lacks a viable responsive or adaptive treatment for a target platform or
  dimension;
- duplicates or conflicts with existing design-system components or tokens.

Visual fidelity does not justify reducing accessibility, security, usability,
or platform correctness. Any material deviation from the supplied design,
including a deviation intended to follow Material guidance or a platform
convention, requires explicit approval. Never silently repair a conflict.

## Gap protocol

Report every missing or conflicting decision that can change the experience or
implementation before working on the dependent scope. Use exactly this
five-line structure:

```text
Gap: missing or conflicting decision.
Evidence: source and location.
Impact: user or implementation consequence.
Recommendation: proposed resolution and reason.
Requires decision: yes or no.
```

A recommendation is not approval. Do not deviate materially from a design
until the user approves the decision. Do not silently repair a design-system,
Material, or platform conflict, copy it blindly, or invent behavior.

## Implementation boundaries

- Keep business logic outside widgets. UI consumes explicit states and does not
  interpret infrastructure exceptions or expose technical error messages.
- Implement initial, loading, empty, content, error, disabled, and success
  states when the readiness contract makes them applicable.
- Reuse the project's theme, design system, components, localization, and
  established conventions. Do not scatter literal copy, color, spacing, or
  styles when project abstractions already own them.
- Build from real constraints rather than arbitrary device constants.
- Use `const`, builders, and granular state selection when they provide
  observable value, not as ceremony.
- Give controllers, focus nodes, subscriptions, and asynchronous operations an
  explicit lifecycle owner and cleanup boundary.
- Include applicable semantics, focus order, keyboard behavior, and usable
  touch targets.
- Extract reusable components only when an observed use or responsibility
  justifies the boundary.
- Preserve an existing localization mechanism. Adding localization to a
  single-language project requires an explicit product requirement and
  approval; the UI must still tolerate long and variable text.

## State-driven interaction

| Observable predicate | Required decision | Validation evidence |
|---|---|---|
| A dropdown, segmented control, radio group, tab set, or equivalent receives its current value separately from its options. | Guarantee that the selection value belongs to the available options before building the control. Keep allowed values and normalization in one owned state or configuration boundary. | Test restored, remote, default, and changed values, including an unsupported input. |
| Related controls trigger the same asynchronous flow but use different enablement predicates. | Define one coherent interaction policy while an operation is in flight. Prevent unintended overlap, duplicate submission, or navigation races in the state owner; do not rely only on the next rebuild disabling one control. | Test rapid repeated input and each loading, refreshing, success, and failure transition that changes availability. |
| Visible error handling chooses both copy and an action. | Consume the explicit presentation state and recovery action. Do not switch on repository or vendor failures inside widgets, and do not show retry for every failure by default. | Test the visible message, available action, and absence of an action for non-recoverable outcomes. |

## Responsive and adaptive matrix

Define a matrix before implementation for every target platform and
representative dimension. Each row must record:

| Target platform and dimension | Orientation and window constraints | Input and platform convention | Layout and navigation adaptation | Text/content stress case | Validation evidence |
|---|---|---|---|---|---|
| Named target | Width, height, orientation, and relevant insets | Touch, mouse, keyboard, back behavior, and platform-specific convention | Breakpoints, reflow, scroll, density, and component or navigation changes | Text scaling, long text, localization, empty/loading/error content | Planned or actual render, interaction check, and comparison source |

Derive breakpoints and adaptations from content constraints and the supported
targets, not arbitrary popular device sizes. Validate every required platform
and target dimension represented by the contract. Include compact and expanded
layouts, orientation, input method, system insets, text scaling, and variable
content when they apply. A single phone render is not evidence for tablet,
desktop, web, foldable, landscape, or platform-specific behavior.

Treat a horizontal group containing variable or localized text plus multiple
controls as an explicit reflow decision. Inspect it at compact width, large
text scaling, and with representative long copy. Use `LayoutBuilder`, `Wrap`,
multiple rows, overflow scrolling, or another project-consistent treatment
only when its observed constraints justify that choice; no widget is mandatory.
Apply the same check to transient banners whose text and actions share a row.

## Icons and assets

- Never invent, draw, generate, or approximate icons.
- Use Material icons only when the design or project convention specifies
  them.
- Require the exact original custom SVG for a custom design icon. Absence of
  the exact custom SVG blocks only the dependent UI fragment; continue
  independent approved work without substituting or approximating the icon.
- Use the existing asset directory, naming, organization, manifest convention,
  and rendering mechanism.
- Adding `flutter_svg` requires a dependency evaluation and explicit approval.
  Compare the existing rendering mechanism and other viable alternatives
  before proposing it.
- Do not modify a supplied SVG or other design asset without an explicit
  technical need and approval when the change alters the approved visual.

A visually similar Material icon is still an invented substitution. Request
the exact SVG, block only the affected fragment, and continue independent
approved work.

## Widget and accessibility tests

There is no golden-test requirement or mandate. Follow stronger existing
repository test conventions when present, but do not add golden or snapshot
dependencies solely for this contract.

Widget tests cover interactions, validation, state changes, and other
observable behavior, plus useful built-in accessibility checks. Use Flutter's
built-in checks when they add value for semantics labels, contrast,
touch-target size, and related supported guidelines.

For content that appears or changes without moving focus, decide whether it
must be announced and inspect the resulting semantics tree. Use `liveRegion`
for a justified dynamic announcement, including an actionable refresh failure,
not as decoration. When a semantics label repeats visible descendant text,
merge or exclude descendants deliberately so assistive technology does not
produce a duplicate announcement. Preserve native widget semantics when they
already express the correct label, value, role, action, and enabled state.

Static visual changes with no testable behavior do not require artificial
widget tests. Record that no-behavior predicate and use the rendering and
visual-comparison evidence applicable to the change instead.

## Rendering and visual comparison

When the environment allows it, run and inspect the UI at the representative
target dimensions and platforms from the matrix. Compare renders or captures
against the identified source of truth. Check at least:

- layout, alignment, spacing, typography, color, radius, and elevation;
- overflow, clipping, scrolling, safe areas, and system insets;
- text scaling, long or localized text, and variable content;
- initial, loading, empty, content, error, disabled, and success states that
  apply;
- focus, keyboard, pointer or touch input, back behavior, and transitions;
- asset identity, rendering, and resolution.

Record the source, target platform and dimensions, observed differences, gap
decisions, and resulting comparison evidence. If the environment cannot render
or capture a required target, report the limitation and the validation that
remains unperformed.

## Completion claims

Do not claim visual fidelity beyond the compared viewports, states, platforms,
and exact assets actually verified.
