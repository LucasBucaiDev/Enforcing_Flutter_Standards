import 'dart:io';

void main(List<String> arguments) {
  final root = _parseRoot(arguments);
  if (root == null) return;

  final failures = <String>[];
  final skillsRoot = Directory('${root.path}/.agents/skills');
  if (!skillsRoot.existsSync()) {
    failures.add('Missing .agents/skills directory.');
  } else {
    _validateSkillStructure(root, skillsRoot, failures);
  }
  _validateLocalMarkdownLinks(root, skillsRoot, failures);

  if (failures.isNotEmpty) {
    stderr.writeln('Skill quality validation failed:');
    for (final failure in failures) {
      stderr.writeln('- $failure');
    }
    exitCode = 1;
    return;
  }

  stdout.writeln('Skill quality validation passed.');
}

Directory? _parseRoot(List<String> arguments) {
  var rootPath = Directory.current.path;
  for (var index = 0; index < arguments.length; index++) {
    final argument = arguments[index];
    if (argument == '--root' && index + 1 < arguments.length) {
      rootPath = arguments[++index];
      continue;
    }
    stderr.writeln('Usage: dart run tool/validate_skills.dart [--root <path>]');
    exitCode = 64;
    return null;
  }

  final root = Directory(rootPath).absolute;
  if (!root.existsSync()) {
    stderr.writeln('Root does not exist: ${root.path}');
    exitCode = 66;
    return null;
  }
  return root;
}

void _validateSkillStructure(
  Directory root,
  Directory skillsRoot,
  List<String> failures,
) {
  final skillDirectories =
      skillsRoot.listSync(followLinks: false).whereType<Directory>().toList()
        ..sort((left, right) => left.path.compareTo(right.path));
  if (skillDirectories.isEmpty) {
    failures.add('.agents/skills must contain at least one skill directory.');
    return;
  }

  final declaredNames = <String>{};
  for (final directory in skillDirectories) {
    final directoryName = _basename(directory.path);
    final skillFile = File('${directory.path}/SKILL.md');
    final metadataFile = File('${directory.path}/agents/openai.yaml');
    final skillLabel = _relative(root, skillFile.path);

    if (!skillFile.existsSync()) {
      failures.add('${_relative(root, directory.path)} is missing SKILL.md.');
      continue;
    }
    if (!metadataFile.existsSync()) {
      failures.add('$skillLabel is missing agents/openai.yaml.');
    }

    final frontmatter = _readFrontmatter(skillFile, failures, skillLabel);
    if (frontmatter == null) continue;

    final name = frontmatter['name'];
    if (name == null || name.isEmpty) {
      failures.add('$skillLabel frontmatter must declare a non-empty name.');
    } else {
      if (!RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$').hasMatch(name)) {
        failures.add('$skillLabel has invalid skill name: $name.');
      }
      if (name != directoryName) {
        failures.add(
          '$skillLabel name must match its directory: '
          'expected $directoryName, found $name.',
        );
      }
      if (!declaredNames.add(name)) {
        failures.add('Duplicate skill name: $name.');
      }
    }

    final description = frontmatter['description'];
    if (description == null || description.isEmpty) {
      failures.add(
        '$skillLabel frontmatter must declare a non-empty description.',
      );
    }
  }
}

Map<String, String>? _readFrontmatter(
  File file,
  List<String> failures,
  String label,
) {
  final lines = file.readAsLinesSync();
  if (lines.isEmpty || lines.first.trim() != '---') {
    failures.add('$label must start with YAML frontmatter.');
    return null;
  }

  final closingIndex = lines.indexWhere((line) => line.trim() == '---', 1);
  if (closingIndex == -1) {
    failures.add('$label has unterminated YAML frontmatter.');
    return null;
  }

  final values = <String, String>{};
  for (final line in lines.sublist(1, closingIndex)) {
    final match = RegExp(
      r'^([a-zA-Z][a-zA-Z0-9_-]*):\s*(.*)$',
    ).firstMatch(line);
    if (match == null) continue;
    values[match.group(1)!] = match.group(2)!.trim();
  }
  return values;
}

void _validateLocalMarkdownLinks(
  Directory root,
  Directory skillsRoot,
  List<String> failures,
) {
  final markdownFiles = <File>[];
  if (skillsRoot.existsSync()) {
    markdownFiles.addAll(
      skillsRoot
          .listSync(recursive: true, followLinks: false)
          .whereType<File>()
          .where((file) => file.path.endsWith('.md')),
    );
  }
  final readme = File('${root.path}/README.md');
  if (readme.existsSync()) markdownFiles.add(readme);
  markdownFiles.sort((left, right) => left.path.compareTo(right.path));

  final linkPattern = RegExp(r'!?\[[^\]]*\]\(([^)\n]+)\)');
  for (final file in markdownFiles) {
    final content = file.readAsStringSync();
    for (final match in linkPattern.allMatches(content)) {
      final target = _localTarget(match.group(1)!);
      if (target == null) continue;
      final decodedTarget = _decodeTarget(target);
      final candidate = File('${file.parent.path}/$decodedTarget');
      final directoryCandidate = Directory(candidate.path);
      if (!candidate.existsSync() && !directoryCandidate.existsSync()) {
        failures.add(
          '${_relative(root, file.path)} links to missing local target: '
          '$target.',
        );
      }
    }
  }
}

String? _localTarget(String rawTarget) {
  var target = rawTarget.trim();
  if (target.startsWith('<')) {
    final closing = target.indexOf('>');
    if (closing == -1) return target;
    target = target.substring(1, closing);
  } else {
    target = target.split(RegExp(r'\s+')).first;
  }
  if (target.isEmpty || target.startsWith('#')) return null;
  if (target.startsWith('//')) return null;
  if (RegExp(r'^[a-zA-Z][a-zA-Z0-9+.-]*:').hasMatch(target)) return null;
  return target.split('#').first.split('?').first;
}

String _decodeTarget(String target) {
  try {
    return Uri.decodeComponent(target);
  } on FormatException {
    return target;
  }
}

String _basename(String path) {
  final normalized = path.endsWith(Platform.pathSeparator)
      ? path.substring(0, path.length - 1)
      : path;
  return normalized.substring(
    normalized.lastIndexOf(Platform.pathSeparator) + 1,
  );
}

String _relative(Directory root, String path) {
  final prefix = '${root.path}${Platform.pathSeparator}';
  return path.startsWith(prefix) ? path.substring(prefix.length) : path;
}
