# Flutter quality

Load this reference when observable Flutter or Dart evidence requires selecting
tests, code generation, coverage, or repository-defined validation commands.
The active process skill owns test-first ordering, diff review, completion,
changelog, exceptions, and report forms.

## Select test evidence

Mirror the established project test structure and tools. Choose from behavior:

| Observable Flutter predicate | Contribute |
|---|---|
| Pure Dart unit, mapper, repository, service, Cubit, Bloc, or model behavior | Focused unit test using the repository's existing fakes, fixtures, and Bloc helpers when present. |
| Widget interaction, validation, navigation trigger, semantics, or state-driven rendering | Focused widget test preserving the existing harness and dependency injection. |
| Plugin/native boundary or multi-component flow not represented faithfully below integration level | Existing integration-test approach and supported target. |
| Static visual output without testable behavior | No widget test solely for appearance; apply repository convention and visual comparison. Golden tooling remains optional and requires dependency approval when absent. |

For changed widget behavior, identify the interaction, pump/settle policy,
state or dependency setup, and observable expectation. Exact assets are not
substitutable test fixtures.

## Freezed and generated outputs

When a changed type requires Freezed or JSON generation, use the project's
established generator command and policy. Common commands such as
`dart run build_runner build --delete-conflicting-outputs` are only candidates;
prefer the exact repository script or workspace command. Record generated
inputs, expected outputs, whether generated files are versioned, and the stale
output check. Do not change generated-file policy implicitly.

## Coverage and gates

Use repository-defined commands from Melos, scripts, CI, Makefiles, or package
manifests. Contribute applicable commands for:

- `dart format --output=none --set-exit-if-changed <scope>`;
- `dart analyze` or `flutter analyze` at each affected root;
- focused and full `dart test` or `flutter test` suites;
- coverage when a threshold exists or changed behavior must be measured;
- code generation and generated-file consistency;
- builds for changed dependencies, plugins, native configuration, flavors, or
  delivery behavior.

Do not infer success from a partial gate. Record exact command, root/package,
target or flavor, exit status, counts or thresholds, and actual result.

For a modified local package, repeat every applicable Flutter gate in that
package. For each direct dependent affected by its API or behavior, repeat the
applicable analysis, tests, generation consistency, and build checks there;
root tests alone are insufficient. State the dependency edge and every gate
that the process skill must run or explicitly skip with a reason.
