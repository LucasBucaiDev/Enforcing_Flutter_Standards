import 'dart:convert';
import 'dart:io';

void main() {
  final root = Directory.current.absolute;
  final failures = <String>[];

  final genericRoot = Directory(
    '${root.path}/.agents/skills/evidence-driven-development',
  );
  final genericSkill = File('${genericRoot.path}/SKILL.md');
  final flutterRoot = Directory(
    '${root.path}/.agents/skills/enforcing-flutter-standards',
  );
  final flutterSkill = File('${flutterRoot.path}/SKILL.md');
  const flutterEntrySkills = <String, String>{
    'flutter-widget-testing': 'widget-testing.md',
    'flutter-integration-testing': 'integration-testing.md',
    'flutter-layout-diagnostics': 'layout-diagnostics.md',
    'flutter-localization': 'localization.md',
    'flutter-widget-previews': 'widget-previews.md',
    'flutter-navigation': 'navigation.md',
  };

  const genericReferences = <String>[
    'diagnose.md',
    'design-and-approve.md',
    'audit-and-review.md',
    'test-first-change.md',
    'verify-and-complete.md',
    'report-contracts.md',
    'delegation-and-concurrency.md',
  ];

  _expect(
    genericSkill.existsSync(),
    'Missing .agents/skills/evidence-driven-development/SKILL.md.',
    failures,
  );

  if (genericSkill.existsSync()) {
    final content = genericSkill.readAsStringSync();
    _checkBudget(
      'evidence-driven-development/SKILL.md',
      content,
      maxLines: 120,
      maxWords: 700,
      maxBytes: 6 * 1024,
      failures: failures,
    );
    _expect(
      _frontmatterDescriptionWords(content) <= 80,
      'Generic skill description exceeds 80 words.',
      failures,
    );

    for (final name in genericReferences) {
      final reference = File('${genericRoot.path}/references/$name');
      _expect(
        reference.existsSync(),
        'Missing generic reference $name.',
        failures,
      );
      _expect(
        content.contains('references/$name'),
        'Generic SKILL.md must route directly to references/$name.',
        failures,
      );
      if (reference.existsSync()) {
        _checkBudget(
          'references/$name',
          reference.readAsStringSync(),
          maxLines: 140,
          maxWords: 800,
          maxBytes: 8 * 1024,
          failures: failures,
        );
      }
    }

    final designContract = File(
      '${genericRoot.path}/references/design-and-approve.md',
    );
    final implementationContract = File(
      '${genericRoot.path}/references/test-first-change.md',
    );
    final delegationContract = File(
      '${genericRoot.path}/references/delegation-and-concurrency.md',
    );
    final verificationContract = File(
      '${genericRoot.path}/references/verify-and-complete.md',
    );
    if (designContract.existsSync()) {
      final content = designContract.readAsStringSync();
      for (final field in const [
        'Plan revision:',
        'User-visible objective:',
        'Observable acceptance criteria:',
        'Implementation map:',
        'Execution sequence:',
        'Test matrix:',
        'Risks and recovery:',
      ]) {
        _expect(
          content.contains(field),
          'Design contract is missing required field $field',
          failures,
        );
      }
      _expect(
        content.contains('A material change modifies'),
        'Design contract must define material plan changes.',
        failures,
      );
    }
    if (implementationContract.existsSync()) {
      final content = implementationContract.readAsStringSync();
      _expect(
        content.contains('approved batch and plan revision'),
        'Implementation must require an approved batch and plan revision.',
        failures,
      );
      _expect(
        content.contains('approved implementation map'),
        'Implementation must enforce the approved implementation map.',
        failures,
      );
      for (final clause in const [
        'inspect the current Git branch',
        'Never mutate on `main`',
        '`bug/<task-description>`',
        '`feature/<task-description>`',
        'lowercase kebab-case',
        'explicit approval to create and switch',
      ]) {
        _expect(
          content.contains(clause),
          'Implementation branch gate is missing clause: $clause',
          failures,
        );
      }
    }
    if (designContract.existsSync()) {
      final content = designContract.readAsStringSync();
      for (final field in const [
        'Execution topology:',
        'coordinator:',
        'delegated tasks:',
        'isolation:',
        'integration order:',
        'final verification owner:',
      ]) {
        _expect(
          content.contains(field),
          'Design contract is missing execution topology field $field',
          failures,
        );
      }
    }
    if (delegationContract.existsSync()) {
      final content = delegationContract.readAsStringSync();
      for (final field in const [
        'Task:',
        'Phase:',
        'Purpose:',
        'Access:',
        'Scope:',
        'Required evidence:',
        'Dependencies:',
        'Prohibited actions:',
        'Stop conditions:',
        'Return:',
      ]) {
        _expect(
          content.contains(field),
          'Delegation contract is missing task field $field',
          failures,
        );
      }
      for (final clause in const [
        'at least two independent lines',
        'must not redelegate',
        'shared lockfiles or generated outputs',
        'contradictory results',
        'delegated evidence',
      ]) {
        _expect(
          content.contains(clause),
          'Delegation contract is missing clause: $clause',
          failures,
        );
      }
    }
    if (verificationContract.existsSync()) {
      final content = verificationContract.readAsStringSync();
      for (final clause in const [
        'delegated evidence',
        'mutation-capable gates',
        'aggregated diff',
        'invalidates affected gates',
      ]) {
        _expect(
          content.contains(clause),
          'Verification contract is missing clause: $clause',
          failures,
        );
      }
    }
  }

  _expect(flutterSkill.existsSync(), 'Missing Flutter SKILL.md.', failures);
  if (flutterSkill.existsSync()) {
    _checkBudget(
      'enforcing-flutter-standards/SKILL.md',
      flutterSkill.readAsStringSync(),
      maxLines: 140,
      maxWords: 800,
      maxBytes: 7 * 1024,
      failures: failures,
    );

    final flutterContracts = <String, List<String>>{
      'architecture-and-state.md': [
        'silent empty widget',
        'presentation-owned failure',
        'callback boundary',
      ],
      'networking-and-errors.md': [
        'recovery action',
        'retryability',
        '`signIn`',
      ],
      'ui-implementation.md': [
        'selection value belongs to the available options',
        'operation is in flight',
        'duplicate announcement',
        '`liveRegion`',
      ],
      'widget-testing.md': [
        '## Activate',
        '## Steps',
        '## Common failures',
        '## Verify',
        '`pumpAndSettle`',
      ],
      'integration-testing.md': [
        'supported target',
        'native platform UI',
        '`flutter_driver`',
        '## Common failures',
      ],
      'layout-diagnostics.md': [
        'Constraints go down',
        '`RenderFlex`',
        'Flutter inspector',
        '## Verify',
      ],
      'localization.md': [
        'existing localization',
        '`l10n.yaml`',
        '`flutter gen-l10n`',
        '## Verify',
      ],
      'widget-previews.md': [
        '`flutter widget-preview start`',
        '`@Preview`',
        'experimental',
        'native plugin',
        'Chrome',
      ],
      'navigation.md': [
        'deep link',
        'nested navigation',
        'Retain a coherent declarative router',
        'DevTools',
        'Android',
        'iOS',
        'web',
      ],
      'runtime-inspection.md': [
        'Capability discovery',
        'Never invent a tool',
        'target entrypoint',
        'device or platform',
        'initial state',
        'actions performed',
        'evidence obtained',
        'partial',
        'unavailable',
        'external state',
        'destructive',
      ],
    };
    for (final entry in flutterContracts.entries) {
      final reference = File('${flutterRoot.path}/references/${entry.key}');
      _expect(
        reference.existsSync(),
        'Missing Flutter reference ${entry.key}.',
        failures,
      );
      if (!reference.existsSync()) continue;
      final content = reference.readAsStringSync();
      if (entry.key == 'widget-testing.md' ||
          entry.key == 'integration-testing.md' ||
          entry.key == 'layout-diagnostics.md' ||
          entry.key == 'localization.md' ||
          entry.key == 'widget-previews.md') {
        _checkBudget(
          'references/${entry.key}',
          content,
          maxLines: 100,
          maxWords: 600,
          maxBytes: 6 * 1024,
          failures: failures,
        );
        _expect(
          flutterSkill.readAsStringSync().contains('references/${entry.key}'),
          'Flutter SKILL.md must route directly to references/${entry.key}.',
          failures,
        );
        for (final heading in const [
          '## Activate',
          '## Steps',
          '## Common failures',
          '## Verify',
        ]) {
          _expect(
            content.contains(heading),
            '${entry.key} is missing operational heading: $heading',
            failures,
          );
        }
      }
      for (final clause in entry.value) {
        _expect(
          content.contains(clause),
          '${entry.key} is missing widget contract clause: $clause',
          failures,
        );
      }
    }

    final runtimeInspection = File(
      '${flutterRoot.path}/references/runtime-inspection.md',
    );
    if (runtimeInspection.existsSync()) {
      final content = runtimeInspection.readAsStringSync();
      _checkBudget(
        'references/runtime-inspection.md',
        content,
        maxLines: 120,
        maxWords: 750,
        maxBytes: 8 * 1024,
        failures: failures,
      );
      _expect(
        flutterSkill.readAsStringSync().contains(
          'references/runtime-inspection.md',
        ),
        'Flutter SKILL.md must route directly to runtime-inspection.md.',
        failures,
      );
    }
    for (final consumer in const [
      'ui-implementation.md',
      'layout-diagnostics.md',
      'integration-testing.md',
    ]) {
      final content = File(
        '${flutterRoot.path}/references/$consumer',
      ).readAsStringSync();
      _expect(
        content.contains('`runtime-inspection.md`'),
        '$consumer must link to runtime-inspection.md.',
        failures,
      );
    }
  }

  for (final entry in flutterEntrySkills.entries) {
    final entryRoot = Directory('${root.path}/.agents/skills/${entry.key}');
    final entrySkill = File('${entryRoot.path}/SKILL.md');
    final openAiMetadata = File('${entryRoot.path}/agents/openai.yaml');

    _expect(
      entryRoot.existsSync(),
      'Missing entry skill ${entry.key}.',
      failures,
    );
    _expect(
      entrySkill.existsSync(),
      'Missing ${entry.key}/SKILL.md.',
      failures,
    );
    _expect(
      openAiMetadata.existsSync(),
      'Missing ${entry.key}/agents/openai.yaml.',
      failures,
    );

    if (entrySkill.existsSync()) {
      final content = entrySkill.readAsStringSync();
      _checkBudget(
        '${entry.key}/SKILL.md',
        content,
        maxLines: 40,
        maxWords: 220,
        maxBytes: 3 * 1024,
        failures: failures,
      );
      _expect(
        content.contains('name: ${entry.key}'),
        '${entry.key} must declare its exact skill name.',
        failures,
      );
      _expect(
        _frontmatterDescriptionWords(content) <= 55,
        '${entry.key} description exceeds 55 words.',
        failures,
      );
      for (final dependency in const [
        'evidence-driven-development',
        'enforcing-flutter-standards',
      ]) {
        _expect(
          content.contains('`$dependency`'),
          '${entry.key} must declare required skill $dependency.',
          failures,
        );
      }
      _expect(
        content.contains('If either required skill is unavailable'),
        '${entry.key} must define the missing-dependency gate.',
        failures,
      );
      _expect(
        content.contains('report the missing skill and stop'),
        '${entry.key} must block with an actionable dependency message.',
        failures,
      );
      _expect(
        content.contains('make it available before retrying'),
        '${entry.key} must state how to recover the missing dependency.',
        failures,
      );
      _expect(
        content.contains('`${entry.value}`'),
        '${entry.key} must select only ${entry.value}.',
        failures,
      );
      for (final forbidden in flutterEntrySkills.values.where(
        (recipe) => recipe != entry.value,
      )) {
        _expect(
          !content.contains('`$forbidden`'),
          '${entry.key} must not select unrelated recipe $forbidden.',
          failures,
        );
      }
      for (final duplicatedContract in const [
        'references/design-and-approve.md',
        'references/test-first-change.md',
        'references/verify-and-complete.md',
      ]) {
        _expect(
          !content.contains(duplicatedContract),
          '${entry.key} must not duplicate process contract $duplicatedContract.',
          failures,
        );
      }
    }

    if (openAiMetadata.existsSync()) {
      final content = openAiMetadata.readAsStringSync();
      _expect(
        content.contains('\$${entry.key}'),
        '${entry.key} metadata default prompt must invoke the entry skill.',
        failures,
      );
    }
  }

  final flutterBehaviorScenarios = File(
    '${root.path}/skill-evals/enforcing-flutter-standards/'
    'behavior-scenarios.md',
  );
  _expect(
    flutterBehaviorScenarios.existsSync(),
    'Missing Flutter behavior scenarios.',
    failures,
  );
  if (flutterBehaviorScenarios.existsSync()) {
    final content = flutterBehaviorScenarios.readAsStringSync();
    for (var scenario = 16; scenario <= 30; scenario++) {
      _expect(
        content.contains('## F$scenario —'),
        'Missing active behavior scenario F$scenario.',
        failures,
      );
    }
  }

  final activeSkillFiles = _filesBelow(
    Directory('${root.path}/.agents/skills'),
    extensions: const {'.md', '.yaml'},
  );
  final superpowersMentions = <String>[];
  for (final file in activeSkillFiles) {
    if (file.readAsStringSync().toLowerCase().contains('superpowers')) {
      superpowersMentions.add(_relative(root, file));
    }
  }
  _expect(
    superpowersMentions.isEmpty,
    'Active skill files still mention Superpowers: '
    '${superpowersMentions.join(', ')}.',
    failures,
  );

  for (final legacy in const [
    'standalone-workflow.md',
    'superpowers-integration.md',
    'audit-contract.md',
    'audit-report-template.md',
  ]) {
    _expect(
      !File('${flutterRoot.path}/references/$legacy').existsSync(),
      'Legacy embedded workflow file still active: $legacy.',
      failures,
    );
  }

  if (failures.isNotEmpty) {
    stderr.writeln('Context budget RED (${failures.length} failures):');
    for (final failure in failures) {
      stderr.writeln('- $failure');
    }
    exitCode = 1;
    return;
  }

  stdout.writeln('Context budget GREEN: all static gates passed.');
}

void _checkBudget(
  String label,
  String content, {
  required int maxLines,
  required int maxWords,
  required int maxBytes,
  required List<String> failures,
}) {
  final lines = content.isEmpty
      ? 0
      : '\n'.allMatches(content).length + (content.endsWith('\n') ? 0 : 1);
  final words = _wordCount(content);
  final bytes = utf8.encode(content).length;
  _expect(
    lines <= maxLines,
    '$label has $lines lines; maximum is $maxLines.',
    failures,
  );
  _expect(
    words <= maxWords,
    '$label has $words words; maximum is $maxWords.',
    failures,
  );
  _expect(
    bytes <= maxBytes,
    '$label has $bytes bytes; maximum is $maxBytes.',
    failures,
  );
}

int _frontmatterDescriptionWords(String content) {
  final match = RegExp(
    r'^---\s*\n[\s\S]*?^description:\s*(.+)$[\s\S]*?^---\s*$',
    multiLine: true,
  ).firstMatch(content);
  return match == null ? 1000000 : _wordCount(match.group(1)!);
}

int _wordCount(String value) {
  return RegExp(
    r"[A-Za-z0-9À-ÖØ-öø-ÿ][A-Za-z0-9À-ÖØ-öø-ÿ'_-]*",
  ).allMatches(value).length;
}

List<File> _filesBelow(Directory directory, {required Set<String> extensions}) {
  if (!directory.existsSync()) return const [];
  final files =
      directory
          .listSync(recursive: true, followLinks: false)
          .whereType<File>()
          .where((file) => extensions.any(file.path.endsWith))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));
  return files;
}

String _relative(Directory root, File file) {
  return file.path.substring(root.path.length + 1);
}

void _expect(bool condition, String message, List<String> failures) {
  if (!condition) failures.add(message);
}
