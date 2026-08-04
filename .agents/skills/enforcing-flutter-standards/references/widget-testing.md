# Flutter widget testing recipe

<!-- provenance: flutter-widget-testing, project-policy-widget-testing -->

Use this recipe for observable interaction, validation, navigation triggers,
semantics, or state-driven rendering inside a widget test harness.

## Activate

Choose a widget test when the behavior is faithfully observable below a full
application or native/plugin boundary. Preserve the repository's existing test
layout, wrappers, dependency injection, fakes, fixtures, localization, and Bloc
helpers. Do not add a test dependency when the current harness is sufficient.

## Steps

1. Name one interaction and its visible, semantic, callback, or navigation
   outcome. Record applicable initial and failure states.
2. Reuse the smallest established app or feature wrapper that supplies theme,
   localization, routing, and state dependencies without rebuilding production.
3. Build with `testWidgets`, a `WidgetTester`, and stable finders based on
   semantics, keys, types, or owned copy according to project convention.
4. Perform the user action. Use `pump` for a known frame or duration;
   use `pumpAndSettle` only when all scheduled work is expected to settle.
5. Assert the observable result and important absence. Test semantics or focus
   only when the behavior requires it; do not create a golden for interaction.
6. Run the repository's focused command. Only when none exists, consider
   `flutter test <file> --plain-name <name>` from the affected Flutter root.

## Common failures

- `pumpAndSettle` times out because an animation, timer, or stream never settles.
- The harness omits inherited theme, localization, routing, or state dependencies.
- Text-only finders couple behavior to translated copy or duplicate labels.
- A platform channel or plugin makes the isolated widget environment inaccurate.
- Broad mocks reproduce implementation calls instead of user-visible behavior.

## Verify

Rerun the focused test after GREEN and scoped refactoring, then the affected
widget suite. Record the command, Flutter root, exit status, and test count. If
the behavior crosses a real plugin or whole-app boundary, stop and route to the
integration-testing recipe instead of weakening the widget test.
