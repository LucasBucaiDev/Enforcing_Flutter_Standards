import 'dart:convert';
import 'dart:io';

const _referenceNames = <String>[
  'architecture-and-state.md',
  'flutter-quality.md',
  'navigation.md',
  'networking-and-errors.md',
  'packages-and-integrations.md',
  'persistence.md',
  'security-and-environments.md',
  'ui-implementation.md',
];

void main() {
  final root = Directory.current.absolute;
  final skillRoot = Directory(
    '${root.path}/.agents/skills/enforcing-flutter-standards',
  );
  final catalogFile = File('${skillRoot.path}/references/source-catalog.json');
  final failures = <String>[];

  final skillContent = File('${skillRoot.path}/SKILL.md').readAsStringSync();
  _expect(
    RegExp(r'^compatibility: .+$', multiLine: true).hasMatch(skillContent),
    'SKILL.md frontmatter must declare compatibility.',
    failures,
  );
  _expect(
    skillContent.contains('Requires evidence-driven-development'),
    'SKILL.md compatibility must declare evidence-driven-development.',
    failures,
  );

  _expect(catalogFile.existsSync(), 'Missing source-catalog.json.', failures);
  if (catalogFile.existsSync()) {
    Object? decoded;
    try {
      decoded = jsonDecode(catalogFile.readAsStringSync());
    } on FormatException catch (error) {
      failures.add('source-catalog.json is invalid JSON: $error');
    }

    if (decoded is Map<String, dynamic>) {
      failures.addAll(_validateCatalog(decoded, skillRoot));
    } else if (decoded != null) {
      failures.add('source-catalog.json must contain a JSON object.');
    }
  }

  _verifyInvalidCatalogFixtures(failures);

  if (failures.isNotEmpty) {
    stderr.writeln('Source catalog validation failed:');
    for (final failure in failures) {
      stderr.writeln('- $failure');
    }
    exitCode = 1;
    return;
  }

  stdout.writeln('Source catalog validation passed.');
}

List<String> _validateCatalog(
  Map<String, dynamic> catalog,
  Directory skillRoot, {
  Map<String, String>? referenceContents,
}) {
  final failures = <String>[];
  _expect(catalog['schemaVersion'] == 1, 'schemaVersion must be 1.', failures);

  final compatibility = catalog['compatibility'];
  if (compatibility is! Map<String, dynamic>) {
    failures.add('compatibility must be an object.');
  } else {
    for (final field in const ['flutter', 'dart']) {
      _expect(
        compatibility[field] is String &&
            (compatibility[field] as String).trim().isNotEmpty,
        'compatibility.$field must be a non-empty string.',
        failures,
      );
    }
  }

  final rawSources = catalog['sources'];
  if (rawSources is! List<dynamic> || rawSources.isEmpty) {
    failures.add('sources must be a non-empty list.');
    return failures;
  }

  final sourceIds = <String>{};
  for (final rawSource in rawSources) {
    if (rawSource is! Map<String, dynamic>) {
      failures.add('Every source must be an object.');
      continue;
    }

    final id = rawSource['id'];
    if (id is! String || id.trim().isEmpty) {
      failures.add('Every source must have a non-empty id.');
      continue;
    }
    if (!sourceIds.add(id)) failures.add('Duplicate source id: $id.');

    for (final field in const [
      'topic',
      'authority',
      'applicability',
      'version',
    ]) {
      final value = rawSource[field];
      _expect(
        value is String && value.trim().isNotEmpty,
        'Source $id has missing or empty $field.',
        failures,
      );
    }

    final version = rawSource['version'];
    if (version is String && version.startsWith('not-version-bound')) {
      _expect(
        version.startsWith('not-version-bound:'),
        'Source $id must justify not-version-bound.',
        failures,
      );
    }

    final authority = rawSource['authority'];
    _expect(
      authority == 'official' || authority == 'project-policy',
      'Source $id has invalid authority: $authority.',
      failures,
    );

    final url = rawSource['url'];
    if (authority == 'official') {
      _expect(
        url is String && Uri.tryParse(url)?.hasScheme == true,
        'Official source $id must have an absolute URL.',
        failures,
      );
    } else {
      _expect(
        url == null,
        'Project policy $id must use null instead of an external URL.',
        failures,
      );
    }

    final verifiedOn = rawSource['verifiedOn'];
    _expect(
      verifiedOn is String && _isIsoDate(verifiedOn),
      'Source $id has invalid verifiedOn date: $verifiedOn.',
      failures,
    );
  }

  final usedIds = <String>{};
  for (final name in _referenceNames) {
    final content =
        referenceContents?[name] ??
        File('${skillRoot.path}/references/$name').readAsStringSync();
    final match = RegExp(
      r'<!-- provenance: ([a-z0-9., -]+) -->',
    ).firstMatch(content);
    if (match == null) {
      failures.add('$name is missing its provenance marker.');
      continue;
    }
    final ids = match.group(1)!.split(',').map((id) => id.trim()).toList();
    for (final id in ids) {
      if (!sourceIds.contains(id)) {
        failures.add('$name references unknown source id: $id.');
      }
      usedIds.add(id);
    }
  }

  for (final id in sourceIds.difference(usedIds)) {
    failures.add('Source id is not used by an active reference: $id.');
  }

  return failures;
}

void _verifyInvalidCatalogFixtures(List<String> failures) {
  final validSource = <String, dynamic>{
    'id': 'flutter-docs',
    'topic': 'Flutter documentation',
    'authority': 'official',
    'url': 'https://docs.flutter.dev/',
    'verifiedOn': '2026-08-04',
    'applicability': 'All active references',
    'version': 'not-version-bound: fixture policy is SDK-independent',
  };
  final references = {
    for (final name in _referenceNames)
      name: '<!-- provenance: flutter-docs -->',
  };

  final validResult = _validateCatalog(
    {
      'schemaVersion': 1,
      'compatibility': {
        'flutter': 'Flutter 3.44.7 documentation snapshot',
        'dart': 'not-version-bound: no Dart SDK API is exercised',
      },
      'sources': [validSource],
    },
    Directory.current,
    referenceContents: references,
  );
  _expect(
    validResult.isEmpty,
    'Validator rejected the valid fixture: ${validResult.join(', ')}.',
    failures,
  );

  final cases = <String, Map<String, dynamic>>{
    'duplicate IDs': {
      'schemaVersion': 1,
      'compatibility': {'flutter': '>=3.22.0', 'dart': '>=3.4.0'},
      'sources': [validSource, Map<String, dynamic>.from(validSource)],
    },
    'invalid dates': {
      'schemaVersion': 1,
      'compatibility': {'flutter': '>=3.22.0', 'dart': '>=3.4.0'},
      'sources': [
        {...validSource, 'verifiedOn': '04/08/2026'},
      ],
    },
    'missing required fields': {
      'schemaVersion': 1,
      'compatibility': {'flutter': '>=3.22.0', 'dart': '>=3.4.0'},
      'sources': [
        {...validSource}..remove('topic'),
      ],
    },
    'unused sources': {
      'schemaVersion': 1,
      'compatibility': {'flutter': '>=3.22.0', 'dart': '>=3.4.0'},
      'sources': [
        validSource,
        {...validSource, 'id': 'unused'},
      ],
    },
  };

  for (final entry in cases.entries) {
    final result = _validateCatalog(
      entry.value,
      Directory.current,
      referenceContents: references,
    );
    _expect(
      result.isNotEmpty,
      'Validator did not reject fixture: ${entry.key}.',
      failures,
    );
  }

  final unknownReferences = Map<String, String>.from(references)
    ..[_referenceNames.first] = '<!-- provenance: unknown -->';
  final unknownResult = _validateCatalog(
    {
      'schemaVersion': 1,
      'compatibility': {'flutter': '>=3.22.0', 'dart': '>=3.4.0'},
      'sources': [validSource],
    },
    Directory.current,
    referenceContents: unknownReferences,
  );
  _expect(
    unknownResult.any((failure) => failure.contains('unknown source id')),
    'Validator did not reject an unknown source id.',
    failures,
  );
}

bool _isIsoDate(String value) {
  if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(value)) return false;
  final parsed = DateTime.tryParse(value);
  if (parsed == null) return false;
  final normalized =
      '${parsed.year.toString().padLeft(4, '0')}-'
      '${parsed.month.toString().padLeft(2, '0')}-'
      '${parsed.day.toString().padLeft(2, '0')}';
  return normalized == value;
}

void _expect(bool condition, String message, List<String> failures) {
  if (!condition) failures.add(message);
}
