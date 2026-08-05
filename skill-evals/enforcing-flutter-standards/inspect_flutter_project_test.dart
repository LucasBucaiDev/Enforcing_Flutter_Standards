import 'dart:convert';
import 'dart:io';

typedef AsyncTestBody = Future<void> Function();

Future<void> main() async {
  final repositoryRoot = Directory.current.absolute;
  final inspector = File(
    '${repositoryRoot.path}/.agents/skills/enforcing-flutter-standards/'
    'scripts/inspect_flutter_project.dart',
  );
  final fixtureRoot = await Directory.systemTemp.createTemp(
    'inspect_flutter_project_test_',
  );

  var passed = 0;
  try {
    await _createFixture(fixtureRoot);
    final before = await _snapshot(fixtureRoot);

    passed += await _runTest(
      'inventory catches missing or incorrect project discovery',
      () async {
        final result = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--root',
          fixtureRoot.path,
          '--format',
          'json',
        ], workingDirectory: repositoryRoot.path);

        _expectEqual(
          result.exitCode,
          0,
          'JSON inventory must exit successfully.\n'
          'stdout: ${result.stdout}\n'
          'stderr: ${result.stderr}',
        );

        final decoded = jsonDecode(result.stdout as String);
        _expect(
          decoded is Map<String, dynamic>,
          'Output must be a JSON object.',
        );
        final inventory = decoded as Map<String, dynamic>;

        _expectEqual(
          inventory['schemaVersion'],
          2,
          'Unexpected schema version.',
        );
        _expectEqual(
          inventory['root'],
          fixtureRoot.resolveSymbolicLinksSync(),
          'Root must be canonical and absolute.',
        );
        _expectStringList(inventory['flutterRoots'], [
          '.',
          'packages/package_a',
        ], 'Flutter roots');

        final largeFiles = _records(inventory, 'largeDartFiles');
        _expectEqual(
          largeFiles,
          [
            {
              'path': 'lib/at_threshold.dart',
              'lineCount': 250,
              'requiresJustification': false,
            },
            {
              'path': 'packages/package_a/lib/needs_justification.dart',
              'lineCount': 400,
              'requiresJustification': true,
            },
          ],
          'Only non-generated Dart files at or above 250 lines belong here.',
        );

        final barrelPaths = _records(
          inventory,
          'barrels',
        ).map((record) => record['path']).toList();
        _expectEqual(
          barrelPaths,
          [
            'lib/features/payments/presentation/presentation.dart',
            'lib/root_app.dart',
            'packages/features/nested_features_package/lib/features/payments/'
                'presentation/presentation.dart',
            'packages/package_a/lib/package_a.dart',
          ],
          'Package and feature/layer barrel candidates must be inventoried.',
        );

        final featureLayers = _records(inventory, 'featureLayers');
        _expectEqual(featureLayers, [
          {
            'path': 'lib/features/payments/presentation/payment_screen.dart',
            'feature': 'payments',
            'layer': 'presentation',
          },
          {
            'path': 'lib/features/payments/presentation/presentation.dart',
            'feature': 'payments',
            'layer': 'presentation',
          },
          {
            'path':
                'packages/features/nested_features_package/lib/features/'
                'payments/presentation/presentation.dart',
            'feature': 'payments',
            'layer': 'presentation',
          },
        ], 'Feature/layer records must be complete and sorted.');
        _expectStringList(inventory['tests'], [
          'packages/package_a/test/package_a_test.dart',
          'test/root_test.dart',
        ], 'Tests');
        _expectStringList(inventory['changelogs'], [
          'CHANGELOG.MD',
        ], 'Changelogs');
        _expectStringList(inventory['analysisOptions'], [
          'analysis_options.yaml',
        ], 'Analysis options');
        _expectStringList(inventory['projectCommands'], [
          '.circleci/config.yml',
          '.github/workflows/ci.yaml',
          'Makefile',
          'melos.yaml',
          'scripts/check.sh',
        ], 'Project command sources');
      },
    );

    passed += await _runTest(
      'operational artifact inventory catches missing focused discovery',
      () async {
        final inventory = await _runJsonInspector(
          inspector,
          fixtureRoot,
          repositoryRoot,
        );

        _expectEqual(
          inventory['schemaVersion'],
          2,
          'Operational artifact sections require schema version 2.',
        );
        _expectEqual(
          _records(inventory, 'localization'),
          [
            {'path': 'l10n.yaml', 'type': 'configuration', 'format': 'yaml'},
            {'path': 'lib/l10n/app_en.arb', 'type': 'arb', 'format': 'json'},
            {
              'path': 'packages/package_a/lib/l10n/package_es.arb',
              'type': 'arb',
              'format': 'json',
            },
          ],
          'Localization configuration and ARB files must be sorted.',
        );
        _expectEqual(
          _records(inventory, 'previews'),
          [
            {
              'path': 'lib/previews/import_only.dart',
              'type': 'previewCandidate',
              'annotationCount': 0,
              'importsPreviewApi': true,
            },
            {
              'path': 'lib/previews/payment_preview.dart',
              'type': 'previewCandidate',
              'annotationCount': 2,
              'importsPreviewApi': true,
            },
          ],
          'Preview candidates must expose only mechanical source metadata.',
        );
        _expectEqual(
          _records(inventory, 'integrationTests'),
          [
            {
              'path': 'integration_test/app_test.dart',
              'type': 'integrationTest',
              'harness': 'integration_test',
            },
            {
              'path': 'test_driver/app.dart',
              'type': 'legacyDriver',
              'harness': 'flutter_driver',
            },
            {
              'path': 'test_driver/app_test.dart',
              'type': 'legacyDriverTest',
              'harness': 'flutter_driver',
            },
          ],
          'Integration and legacy driver files must be classified by type.',
        );
        _expectEqual(
          _records(inventory, 'deepLinkConfigs'),
          [
            {
              'path': 'android/app/src/main/AndroidManifest.xml',
              'type': 'androidManifest',
              'platform': 'android',
            },
            {
              'path': 'ios/Runner/Info.plist',
              'type': 'applePropertyList',
              'platform': 'ios',
            },
            {
              'path': 'ios/Runner/Runner.entitlements',
              'type': 'appleEntitlements',
              'platform': 'ios',
            },
            {
              'path': 'macos/Runner/DebugProfile.entitlements',
              'type': 'appleEntitlements',
              'platform': 'macos',
            },
            {'path': 'web/_redirects', 'type': 'webRewrite', 'platform': 'web'},
            {'path': 'web/index.html', 'type': 'webIndex', 'platform': 'web'},
            {
              'path': 'web/manifest.json',
              'type': 'webManifest',
              'platform': 'web',
            },
          ],
          'Platform configuration inventory must expose paths, not values.',
        );
      },
    );

    passed += await _runTest(
      'projects without operational artifacts keep stable empty sections',
      () async {
        final emptyRoot = await Directory.systemTemp.createTemp(
          'inspect_flutter_project_empty_test_',
        );
        try {
          await _write(emptyRoot, 'pubspec.yaml', 'name: empty_fixture\n');
          final inventory = await _runJsonInspector(
            inspector,
            emptyRoot,
            repositoryRoot,
          );
          for (final section in const [
            'localization',
            'previews',
            'integrationTests',
            'deepLinkConfigs',
          ]) {
            _expectEqual(
              inventory[section],
              const <Object>[],
              '$section must remain an empty JSON list when absent.',
            );
          }
        } finally {
          await emptyRoot.delete(recursive: true);
        }
      },
    );

    passed += await _runTest(
      'output modes catch default drift or text and JSON inconsistency',
      () async {
        final defaultResult = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
        ], workingDirectory: fixtureRoot.path);
        _expectEqual(
          defaultResult.exitCode,
          0,
          'No-argument defaults must succeed from the requested directory.',
        );

        final textResult = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--root',
          fixtureRoot.path,
          '--format',
          'text',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          textResult.exitCode,
          0,
          'Explicit text inventory must exit successfully.',
        );
        _expectEqual(
          defaultResult.stdout,
          textResult.stdout,
          'No arguments must default to the working directory and text mode.',
        );

        final jsonInventory = await _runJsonInspector(
          inspector,
          fixtureRoot,
          repositoryRoot,
        );
        _expectEqual(
          _parseTextInventory(textResult.stdout as String),
          jsonInventory,
          'Text and JSON modes must carry the same deterministic inventory.',
        );
      },
    );

    passed += await _runTest(
      'summary mode catches full inventories used for initial discovery',
      () async {
        final summary = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--root',
          fixtureRoot.path,
          '--format',
          'summary',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(summary.exitCode, 0, 'Summary mode must succeed.');
        final output = summary.stdout as String;
        _expect(
          output.startsWith('Flutter project inventory summary (schema 2)\n'),
          'Summary header is missing.',
        );
        for (final section in const [
          'flutterRoots',
          'packageEdges',
          'cycles',
          'largeDartFiles',
          'barrels',
          'featureLayers',
          'tests',
          'changelogs',
          'analysisOptions',
          'projectCommands',
          'localization',
          'previews',
          'integrationTests',
          'deepLinkConfigs',
        ]) {
          _expect(
            RegExp('^$section: [0-9]+\$', multiLine: true).hasMatch(output),
            'Summary must report the count for $section.',
          );
        }
        _expect(
          output.contains('Expand: --format text --section <name>'),
          'Summary must explain progressive expansion.',
        );
        _expect(
          !output.contains('lib/at_threshold.dart'),
          'Summary must not print inventory records.',
        );
      },
    );

    passed += await _runTest(
      'section selection catches text divergence or unrelated inventory',
      () async {
        final result = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--root',
          fixtureRoot.path,
          '--format',
          'json',
          '--section',
          'packageEdges',
          '--section',
          'cycles',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          result.exitCode,
          0,
          'Selected JSON sections must succeed.',
        );
        final inventory =
            jsonDecode(result.stdout as String) as Map<String, dynamic>;
        _expectEqual(
          inventory.keys.toList(),
          ['schemaVersion', 'root', 'packageEdges', 'cycles'],
          'Projected JSON must contain metadata and requested sections only.',
        );
        _expect(
          (inventory['packageEdges'] as List<dynamic>).isNotEmpty,
          'Selected package edges must retain their records.',
        );

        final textResult = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--root',
          fixtureRoot.path,
          '--format',
          'text',
          '--section',
          'packageEdges',
          '--section',
          'cycles',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          textResult.exitCode,
          0,
          'Selected text sections must succeed.',
        );
        final textOutput = textResult.stdout as String;
        _expectEqual(
          _parseTextInventory(textOutput),
          inventory,
          'Selected text and JSON must carry the same projected inventory.',
        );
        for (final unrelated in const [
          'flutterRoots',
          'largeDartFiles',
          'barrels',
          'featureLayers',
          'tests',
          'changelogs',
          'analysisOptions',
          'projectCommands',
          'localization',
          'previews',
          'integrationTests',
          'deepLinkConfigs',
        ]) {
          _expect(
            !RegExp('^$unrelated \\(', multiLine: true).hasMatch(textOutput),
            'Selected text must exclude the unrelated $unrelated heading.',
          );
        }
      },
    );

    passed += await _runTest(
      'cycle enumeration catches omitted or duplicate overlapping cycles',
      () async {
        final inventory = await _runJsonInspector(
          inspector,
          fixtureRoot,
          repositoryRoot,
        );
        _expectEqual(
          inventory['cycles'],
          [
            [
              'packages/package_a',
              'packages/package_b',
              'packages/package_c',
              'packages/package_a',
            ],
            ['packages/package_a', 'packages/package_c', 'packages/package_a'],
          ],
          'Every overlapping cycle must appear once in canonical order.',
        );
      },
    );

    passed += await _runTest(
      'dependency parsing catches nested Git paths reported as local edges',
      () async {
        final inventory = await _runJsonInspector(
          inspector,
          fixtureRoot,
          repositoryRoot,
        );
        final remoteEdges = _records(
          inventory,
          'packageEdges',
        ).where((edge) => edge['dependency'] == 'remote_package').toList();
        _expectEqual(
          remoteEdges,
          const [],
          'Nested Git paths must not become local package edges.',
        );
      },
    );

    passed += await _runTest(
      'dependency parsing catches quoted hash paths truncated as comments',
      () async {
        final inventory = await _runJsonInspector(
          inspector,
          fixtureRoot,
          repositoryRoot,
        );
        _expectEqual(
          _records(inventory, 'packageEdges'),
          [
            {
              'from': '.',
              'to': 'packages/package_#hash',
              'dependency': 'quoted_package',
            },
            {
              'from': 'packages/package_a',
              'to': 'packages/package_b',
              'dependency': 'package_b',
            },
            {
              'from': 'packages/package_a',
              'to': 'packages/package_c',
              'dependency': 'package_c',
            },
            {
              'from': 'packages/package_b',
              'to': 'packages/package_c',
              'dependency': 'package_c',
            },
            {
              'from': 'packages/package_c',
              'to': 'packages/package_a',
              'dependency': 'package_a',
            },
          ],
          'Quoted hash paths and local edges must remain exact and sorted.',
        );
      },
    );

    passed += await _runTest(
      'read-only contract catches path, byte, or timestamp mutation',
      () async {
        final after = await _snapshot(fixtureRoot);
        _expectEqual(
          after.keys.toList(),
          before.keys.toList(),
          'Inspector changed the fixture file paths.',
        );
        for (final path in before.keys) {
          final beforeFile = before[path]!;
          final afterFile = after[path]!;
          _expectEqual(
            afterFile.bytes,
            beforeFile.bytes,
            'Inspector changed bytes for $path.',
          );
          _expectEqual(
            afterFile.modifiedMicros,
            beforeFile.modifiedMicros,
            'Inspector changed the modification timestamp for $path.',
          );
        }
      },
    );

    passed += await _runTest(
      'argument validation catches invalid CLI input accepted as success',
      () async {
        final invalidFlag = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--unknown',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          invalidFlag.exitCode,
          64,
          'Unknown arguments must use EX_USAGE (64).',
        );
        _expect(
          (invalidFlag.stderr as String).contains('Usage:'),
          'Invalid arguments must print actionable usage to stderr.',
        );

        final invalidFormat = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--format',
          'yaml',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          invalidFormat.exitCode,
          64,
          'Unsupported formats must use EX_USAGE (64).',
        );

        final invalidSection = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--section',
          'unknown',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          invalidSection.exitCode,
          64,
          'Unknown sections must use EX_USAGE (64).',
        );
        _expect(
          (invalidSection.stderr as String).contains(
            'Unknown section: unknown',
          ),
          'Unknown sections must be actionable.',
        );

        final summarySection = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--format',
          'summary',
          '--section',
          'tests',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          summarySection.exitCode,
          64,
          'Summary plus section must use EX_USAGE (64).',
        );
        _expect(
          (summarySection.stderr as String).contains(
            '--section cannot be combined with --format summary',
          ),
          'Invalid summary combinations must explain the correction.',
        );
      },
    );

    passed += await _runTest(
      'missing-root handling catches nonexistent roots accepted as success',
      () async {
        final missingRoot = '${fixtureRoot.path}_missing';
        final result = await Process.run(Platform.resolvedExecutable, [
          'run',
          inspector.path,
          '--root',
          missingRoot,
          '--format',
          'json',
        ], workingDirectory: repositoryRoot.path);
        _expectEqual(
          result.exitCode,
          66,
          'A missing root must use EX_NOINPUT (66).',
        );
      },
    );

    stdout.writeln('PASS: $passed tests');
  } finally {
    if (fixtureRoot.existsSync()) {
      await fixtureRoot.delete(recursive: true);
    }
  }
}

Future<int> _runTest(String name, AsyncTestBody body) async {
  try {
    await body();
    stdout.writeln('PASS: $name');
    return 1;
  } catch (error, stackTrace) {
    stderr.writeln('FAIL: $name');
    stderr.writeln(error);
    stderr.writeln(stackTrace);
    rethrow;
  }
}

Future<void> _createFixture(Directory root) async {
  await _write(root, 'pubspec.yaml', '''
name: root_app
dependencies:
  flutter:
    sdk: flutter
  remote_package:
    git:
      url: https://example.invalid/repository.git
      path: packages/package_a
  quoted_package:
    path: "packages/package_#hash" # local path
''');
  await _write(root, 'analysis_options.yaml', 'analyzer:\n  errors: {}\n');
  await _write(root, 'CHANGELOG.MD', '# Changes\n');
  await _write(root, 'melos.yaml', 'name: fixture_workspace\n');
  await _write(root, 'Makefile', 'check:\n\t@echo check\n');
  await _write(root, 'scripts/check.sh', '#!/bin/sh\nexit 0\n');
  await _write(
    root,
    '.github/workflows/ci.yaml',
    'jobs:\n  test:\n    runs-on: ubuntu-latest\n',
  );
  await _write(root, '.circleci/config.yml', 'version: 2.1\njobs: {}\n');
  await _write(root, 'l10n.yaml', 'arb-dir: lib/l10n\n');
  await _write(root, 'lib/l10n/app_en.arb', '{"title":"Fixture"}\n');
  await _write(
    root,
    'lib/previews/import_only.dart',
    "import 'package:flutter/widget_previews.dart';\n",
  );
  await _write(root, 'lib/previews/payment_preview.dart', '''
import 'package:flutter/widget_previews.dart';

@Preview()
Widget firstPreview() => const Placeholder();

@Preview(name: 'second')
Widget secondPreview() => const Placeholder();
''');
  await _write(root, 'integration_test/app_test.dart', 'void main() {}\n');
  await _write(root, 'test_driver/app.dart', 'void main() {}\n');
  await _write(root, 'test_driver/app_test.dart', 'void main() {}\n');
  await _write(
    root,
    'android/app/src/main/AndroidManifest.xml',
    '<manifest />\n',
  );
  await _write(root, 'ios/Runner/Info.plist', '<plist />\n');
  await _write(root, 'ios/Runner/Runner.entitlements', '<plist />\n');
  await _write(root, 'macos/Runner/DebugProfile.entitlements', '<plist />\n');
  await _write(root, 'web/_redirects', '/* /index.html 200\n');
  await _write(root, 'web/index.html', '<html></html>\n');
  await _write(root, 'web/manifest.json', '{}\n');

  await _write(root, 'lib/root_app.dart', "export 'under_threshold.dart';\n");
  await _writeLines(root, 'lib/under_threshold.dart', 249);
  await _writeLines(root, 'lib/at_threshold.dart', 250);
  await _writeLines(root, 'lib/generated.g.dart', 500);
  await _writeLines(root, 'lib/generated.freezed.dart', 500);
  await _writeLines(root, 'lib/l10n/app_localizations.dart', 500);
  await _writeLines(root, 'lib/generated/l10n.dart', 500);
  await _writeLines(root, 'build/ignored.dart', 500);
  await _writeLines(root, '.dart_tool/ignored.dart', 500);
  await _writeLines(root, '.hidden_cache/ignored.dart', 500);
  await _writeLines(root, 'android/.gradle/ignored.dart', 500);
  await _writeLines(root, 'ios/Pods/ignored.dart', 500);
  await _writeLines(root, 'macos/Flutter/ephemeral/ignored.dart', 500);
  await _write(
    root,
    'lib/features/payments/presentation/payment_screen.dart',
    'class PaymentScreen {}\n',
  );
  await _write(
    root,
    'lib/features/payments/presentation/presentation.dart',
    "export 'payment_screen.dart';\n",
  );
  await _write(root, 'test/root_test.dart', 'void main() {}\n');
  await _write(root, 'test/generated_test.mocks.dart', 'void main() {}\n');

  await _write(root, 'packages/package_a/pubspec.yaml', '''
name: package_a
dependencies:
  flutter:
    sdk: flutter
  package_b:
    path: ../package_b
  package_c:
    path: ../package_c
''');
  await _write(
    root,
    'packages/package_a/lib/package_a.dart',
    "export 'needs_justification.dart';\n",
  );
  await _writeLines(
    root,
    'packages/package_a/lib/needs_justification.dart',
    400,
  );
  await _write(
    root,
    'packages/package_a/test/package_a_test.dart',
    'void main() {}\n',
  );
  await _write(
    root,
    'packages/package_a/lib/l10n/package_es.arb',
    '{"title":"Fixture"}\n',
  );

  await _write(root, 'packages/package_b/pubspec.yaml', '''
name: package_b
dev_dependencies:
  package_c:
    path: ../package_c
''');
  await _write(root, 'packages/package_b/lib/src/b.dart', 'class B {}\n');

  await _write(root, 'packages/package_c/pubspec.yaml', '''
name: package_c
dependencies:
  package_a:
    path: ../package_a
''');
  await _write(root, 'packages/package_c/lib/src/c.dart', 'class C {}\n');

  await _write(root, 'packages/package_#hash/pubspec.yaml', '''
name: quoted_package
''');
  await _write(
    root,
    'packages/package_#hash/lib/src/quoted.dart',
    'class QuotedPackage {}\n',
  );

  await _write(
    root,
    'packages/features/nested_features_package/pubspec.yaml',
    'name: nested_features_package\n',
  );
  await _write(
    root,
    'packages/features/nested_features_package/lib/features/payments/'
        'presentation/presentation.dart',
    "export 'payment_screen.dart';\n",
  );
}

Future<Map<String, dynamic>> _runJsonInspector(
  File inspector,
  Directory fixtureRoot,
  Directory repositoryRoot,
) async {
  final result = await Process.run(Platform.resolvedExecutable, [
    'run',
    inspector.path,
    '--root',
    fixtureRoot.path,
    '--format',
    'json',
  ], workingDirectory: repositoryRoot.path);
  _expectEqual(
    result.exitCode,
    0,
    'JSON inventory must exit successfully.\n'
    'stdout: ${result.stdout}\n'
    'stderr: ${result.stderr}',
  );
  final decoded = jsonDecode(result.stdout as String);
  _expect(decoded is Map<String, dynamic>, 'Output must be a JSON object.');
  return decoded as Map<String, dynamic>;
}

Map<String, dynamic> _parseTextInventory(String output) {
  final lines = const LineSplitter().convert(output);
  _expectEqual(
    lines.first,
    'Flutter project inventory (schema 2)',
    'Text schema header changed.',
  );
  _expect(
    lines.length > 1 && lines[1].startsWith('Root: '),
    'Text root header is missing.',
  );

  final inventory = <String, dynamic>{
    'schemaVersion': 2,
    'root': lines[1].substring('Root: '.length),
  };
  var index = 2;
  while (index < lines.length) {
    final header = RegExp(
      r'^([A-Za-z]+) \(([0-9]+)\):$',
    ).firstMatch(lines[index]);
    _expect(header != null, 'Invalid text section header: ${lines[index]}');
    final key = header!.group(1)!;
    final expectedCount = int.parse(header.group(2)!);
    index++;

    final values = <dynamic>[];
    while (index < lines.length && lines[index].startsWith('  ')) {
      final value = lines[index].substring(2);
      values.add(
        value.startsWith('{') || value.startsWith('[')
            ? jsonDecode(value)
            : value,
      );
      index++;
    }
    _expectEqual(
      values.length,
      expectedCount,
      'Text section $key has the wrong count.',
    );
    inventory[key] = values;
  }
  return inventory;
}

Future<void> _write(Directory root, String relativePath, String content) async {
  final file = File('${root.path}/$relativePath');
  await file.parent.create(recursive: true);
  await file.writeAsString(content);
}

Future<void> _writeLines(Directory root, String relativePath, int lineCount) {
  return _write(
    root,
    relativePath,
    '${List<String>.filled(lineCount, '// fixture line').join('\n')}\n',
  );
}

Future<Map<String, _FileSnapshot>> _snapshot(Directory root) async {
  final snapshots = <String, _FileSnapshot>{};
  final files = await root
      .list(recursive: true, followLinks: false)
      .where((entity) => entity is File)
      .cast<File>()
      .toList();
  files.sort((left, right) => left.path.compareTo(right.path));

  for (final file in files) {
    final stat = await file.stat();
    final relativePath = _relativePath(root.path, file.path);
    snapshots[relativePath] = _FileSnapshot(
      await file.readAsBytes(),
      stat.modified.microsecondsSinceEpoch,
    );
  }
  return snapshots;
}

List<Map<String, dynamic>> _records(
  Map<String, dynamic> inventory,
  String key,
) {
  final value = inventory[key];
  _expect(value is List<dynamic>, '$key must be a JSON list.');
  return (value as List<dynamic>).map((record) {
    _expect(record is Map<String, dynamic>, '$key entries must be objects.');
    return record as Map<String, dynamic>;
  }).toList();
}

void _expectStringList(Object? actual, List<String> expected, String label) {
  _expectEqual(actual, expected, '$label must be complete and sorted.');
}

void _expect(bool condition, String message) {
  if (!condition) {
    throw TestFailure(message);
  }
}

void _expectEqual(Object? actual, Object? expected, String message) {
  if (!_deepEquals(actual, expected)) {
    throw TestFailure('$message\nExpected: $expected\nActual:   $actual');
  }
}

bool _deepEquals(Object? left, Object? right) {
  if (left is List && right is List) {
    if (left.length != right.length) return false;
    for (var index = 0; index < left.length; index++) {
      if (!_deepEquals(left[index], right[index])) return false;
    }
    return true;
  }
  if (left is Map && right is Map) {
    if (left.length != right.length) return false;
    for (final key in left.keys) {
      if (!right.containsKey(key) || !_deepEquals(left[key], right[key])) {
        return false;
      }
    }
    return true;
  }
  return left == right;
}

String _relativePath(String root, String path) {
  final prefix = root.endsWith(Platform.pathSeparator)
      ? root
      : '$root${Platform.pathSeparator}';
  return path.substring(prefix.length).replaceAll(Platform.pathSeparator, '/');
}

final class _FileSnapshot {
  const _FileSnapshot(this.bytes, this.modifiedMicros);

  final List<int> bytes;
  final int modifiedMicros;
}

final class TestFailure implements Exception {
  const TestFailure(this.message);

  final String message;

  @override
  String toString() => message;
}
