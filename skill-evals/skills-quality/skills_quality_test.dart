import 'dart:io';

Future<void> main() async {
  final repositoryRoot = Directory.current.absolute;
  final validator = File('${repositoryRoot.path}/tool/validate_skills.dart');
  final fixturesRoot = Directory(
    '${repositoryRoot.path}/skill-evals/skills-quality/fixtures',
  );
  var passed = 0;

  passed += await _runTest('current skills pass structural validation', () async {
    final result = await _runValidator(
      validator,
      repositoryRoot,
      repositoryRoot,
    );
    _expectEqual(
      result.exitCode,
      0,
      'Current skills must pass.\nstdout: ${result.stdout}\nstderr: ${result.stderr}',
    );
  });

  passed += await _runTest('invalid skill metadata is rejected', () async {
    final fixture = Directory('${fixturesRoot.path}/invalid-metadata');
    final result = await _runValidator(validator, fixture, repositoryRoot);
    _expectEqual(result.exitCode, 1, 'Invalid metadata must fail validation.');
    _expect(
      (result.stderr as String).contains(
        'name must match its directory: expected example-skill, found wrong-name',
      ),
      'Invalid metadata failure must identify the mismatched skill name.',
    );
  });

  passed += await _runTest(
    'broken local Markdown links are rejected',
    () async {
      final fixture = Directory('${fixturesRoot.path}/broken-link');
      final result = await _runValidator(validator, fixture, repositoryRoot);
      _expectEqual(
        result.exitCode,
        1,
        'A broken local link must fail validation.',
      );
      _expect(
        (result.stderr as String).contains(
          'SKILL.md links to missing local target: references/missing.md',
        ),
        'Broken-link failure must identify the missing target.',
      );
    },
  );

  passed += await _runTest('CI preserves the approved quality gates', () async {
    final workflow = File(
      '${repositoryRoot.path}/.github/workflows/skills-quality.yml',
    );
    _expect(workflow.existsSync(), 'Missing skills quality workflow.');
    final content = workflow.readAsStringSync();

    for (final command in const [
      'dart format --output=none --set-exit-if-changed '
          '.agents/skills skill-evals tool',
      'dart run tool/validate_skills.dart',
      'dart run skill-evals/evidence-driven-development/'
          'context_budget_test.dart',
      'dart run skill-evals/enforcing-flutter-standards/'
          'source_catalog_test.dart',
      'dart run skill-evals/enforcing-flutter-standards/'
          'inspect_flutter_project_test.dart',
      'dart run skill-evals/skills-quality/skills_quality_test.dart',
      'git diff --check',
    ]) {
      _expect(
        content.contains(command),
        'Workflow is missing command: $command',
      );
    }

    _expect(
      RegExp(r'permissions:\s*\n\s+contents: read').hasMatch(content),
      'Workflow must grant read-only repository contents permission.',
    );
    for (final action in const ['actions/checkout', 'dart-lang/setup-dart']) {
      _expect(
        RegExp('$action@[0-9a-f]{40}').hasMatch(content),
        '$action must be pinned to a full commit SHA.',
      );
    }
    for (final path in const [
      '.agents/skills/**',
      'skill-evals/**',
      'tool/**',
      'README.md',
      'CHANGELOG.md',
      '.github/workflows/skills-quality.yml',
    ]) {
      _expect(content.contains(path), 'Workflow paths must include $path.');
    }
  });

  stdout.writeln('PASS: $passed tests');
}

Future<ProcessResult> _runValidator(
  File validator,
  Directory root,
  Directory workingDirectory,
) {
  return Process.run(Platform.resolvedExecutable, [
    'run',
    validator.path,
    '--root',
    root.path,
  ], workingDirectory: workingDirectory.path);
}

Future<int> _runTest(String name, Future<void> Function() body) async {
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

void _expect(bool condition, String message) {
  if (!condition) throw StateError(message);
}

void _expectEqual(Object? actual, Object? expected, String message) {
  if (actual != expected) {
    throw StateError('$message\nExpected: $expected\nActual: $actual');
  }
}
