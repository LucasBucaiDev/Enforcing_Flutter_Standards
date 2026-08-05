# Flutter integration testing recipe

<!-- provenance: flutter-integration-testing, project-policy-integration-testing -->

Use this recipe for a complete app journey, a multi-component flow, performance,
or a plugin/native boundary that a widget test cannot represent faithfully.

## Activate

Require an observable reason to cross the widget-test boundary and name the
supported target: physical device, emulator, simulator, desktop, or browser.
Preserve the repository's established `integration_test`, Patrol, device-lab,
or other harness. Do not introduce `flutter_driver`, replace a coherent harness,
or add a dependency without the separate comparison and approval gate.

## Steps

1. Inspect `integration_test/`, manifests, CI, device scripts, flavors, test
   accounts, and existing target commands before choosing a default.
2. Define one critical journey, its starting state, owned test data, external
   boundaries, target platform, and observable outcome.
3. Confirm that the harness can exercise the boundary. Flutter SDK
   `integration_test` cannot interact with native platform UI such as permission
   dialogs; use an existing capable harness or request a dependency decision.
4. Write the test in the existing structure, isolate remote state when the
   project supports it, and avoid arbitrary delays or ordering dependencies.
5. Run the repository command on the named target. Only when none exists,
   consider `flutter test integration_test/<file> -d <device>` for a supported
   target and current Flutter SDK behavior. When observing or interacting with
   the running app outside the harness result, apply `runtime-inspection.md`.

## Common failures

- The command selects a convenient device instead of the required target.
- Native dialogs or platform views are asserted through an incapable harness.
- Shared accounts, network state, time, or test ordering make the flow flaky.
- Desktop Linux CI lacks its configured display server.
- A web run passes although the plugin or requirement is native-only.

## Verify

Record the exact test, command, target ID, platform, flavor, exit status, and
result. Validate every platform named by the requirement; one target is not
evidence for another. Keep migration from legacy `flutter_driver` outside this
recipe unless separately designed and approved.
