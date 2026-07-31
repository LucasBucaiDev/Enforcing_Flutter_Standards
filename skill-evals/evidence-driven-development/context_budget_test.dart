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
  final files = directory
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
