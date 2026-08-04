# Flutter localization recipe

<!-- provenance: flutter-localization, project-policy-localization -->

Use this recipe for locale configuration, ARB messages, generated localization
code, plural/select behavior, or localized UI changes.

## Activate

Inspect and preserve the existing localization mechanism, `pubspec.yaml`,
`l10n.yaml`, ARB layout, source locale, naming, generated-file policy, and test
harness. Adding localization or a package to a single-language project requires
an explicit product requirement and the normal dependency approval gate.

## Steps

1. Locate the authoritative message files and generated outputs. Determine
   whether generated files are committed and which repository command owns them.
2. Add or change the source-locale message with stable identifiers, description,
   placeholders, types, plurals, selects, and escaping consistent with the project.
3. Update supported translations through the project's translation workflow;
   never invent product copy or silently treat machine output as approved copy.
4. Run the repository generator. Only when its configuration establishes the
   standard Flutter tool, use `flutter gen-l10n`; inspect its output and any
   untranslated-messages report.
5. Consume the generated localization API and preserve locale resolution,
   delegates, supported locales, and dependency injection conventions.
6. Exercise representative locales, long text, formatting, plural branches,
   and RTL only when it is in the supported locale contract.

## Common failures

- Editing generated Dart instead of the authoritative ARB or configuration.
- Placeholder names or types differ between the template and a translation.
- A hard-coded string bypasses the existing localization boundary.
- Generation runs from the wrong Flutter root or with stale `l10n.yaml` defaults.
- Layout verification uses only short source-locale copy.

## Verify

Run generation and confirm the repository's stale-output policy is clean. Run
focused localization or widget tests and applicable analysis. Record locales,
plural/select cases, long-copy layout evidence, untranslated messages, command,
and exit status; do not claim translation quality without an authorized source.
