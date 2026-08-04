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
