# Flutter widget previews recipe

<!-- provenance: flutter-widget-previewer, project-policy-widget-previews -->

Use this recipe for Flutter's Widget Previewer, `@Preview` annotations, preview
wrappers, or isolated component preview failures.

## Activate

Preserve existing preview conventions and first confirm the repository Flutter
version. In the validated Flutter 3.44.7 documentation, the previewer is an
experimental feature: Flutter 3.35+ is required and IDE support requires 3.38+.
Its APIs can change, so revalidate the catalog source before copying syntax.

## Steps

1. Inspect SDK constraints, preview files, theme, localization, state injection,
   and the repository command before adding an annotation.
2. Keep preview factories deterministic and separate from product behavior. Use
   `@Preview` on a supported public constructor, static method, or top-level
   function with no unresolved required arguments.
3. Reuse wrappers for theme, inherited state, and localization. Represent useful
   size, text-scale, brightness, and locale cases without duplicating the app.
4. Run the repository command. Only when none exists and the SDK matches the
   verified contract, consider `flutter widget-preview start` from the app root.
5. Treat the result as a Chrome rendering aid. A native plugin, platform view,
   permission UI, or target-specific behavior is not faithfully validated there.

## Common failures

- Experimental annotation or command syntax drifted after the verified version.
- One invalid preview prevents the environment from compiling other previews.
- A preview reads network, clock, global mutable state, or unavailable services.
- Chrome output is reported as Android, iOS, desktop, or native plugin evidence.
- Preview-only wrappers diverge from the real theme or localization boundary.

## Verify

Record the Flutter version, command, preview name, Chrome result, wrapper, size,
theme, locale, and text scale exercised. Use widget or integration tests for
behavior and native targets for platform fidelity; a preview is not a test gate.
