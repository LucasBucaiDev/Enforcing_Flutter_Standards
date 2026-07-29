import 'dart:convert';
import 'dart:io';

const _usage =
    'Usage: dart run inspect_flutter_project.dart '
    '--root DIRECTORY [--format json|text]';

Future<void> main(List<String> arguments) async {
  final options = _parseArguments(arguments);
  if (options == null) {
    exitCode = 64;
    return;
  }

  final requestedRoot = Directory(options.root);
  if (!requestedRoot.existsSync()) {
    stderr.writeln('Root directory does not exist: ${options.root}');
    exitCode = 66;
    return;
  }

  String canonicalRoot;
  try {
    canonicalRoot = requestedRoot.resolveSymbolicLinksSync();
  } on FileSystemException {
    stderr.writeln('Unable to resolve root directory: ${options.root}');
    exitCode = 66;
    return;
  }

  final inventory = _Inspector(Directory(canonicalRoot)).inspect();
  if (options.format == 'json') {
    stdout.writeln(jsonEncode(inventory));
  } else {
    _printText(inventory);
  }
}

_Options? _parseArguments(List<String> arguments) {
  var root = '.';
  var format = 'text';
  var index = 0;

  while (index < arguments.length) {
    final argument = arguments[index];
    if (argument != '--root' && argument != '--format') {
      _usageError('Unknown argument: $argument');
      return null;
    }
    if (index + 1 >= arguments.length) {
      _usageError('Missing value for $argument');
      return null;
    }

    final value = arguments[index + 1];
    if (argument == '--root') {
      if (value.isEmpty) {
        _usageError('Root directory must not be empty.');
        return null;
      }
      root = value;
    } else {
      if (value != 'json' && value != 'text') {
        _usageError('Format must be "json" or "text".');
        return null;
      }
      format = value;
    }
    index += 2;
  }

  return _Options(root, format);
}

void _usageError(String message) {
  stderr.writeln(message);
  stderr.writeln(_usage);
}

void _printText(Map<String, Object> inventory) {
  stdout.writeln(
    'Flutter project inventory (schema ${inventory['schemaVersion']})',
  );
  stdout.writeln('Root: ${inventory['root']}');

  for (final key in const [
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
  ]) {
    final values = inventory[key]! as List<Object>;
    stdout.writeln('$key (${values.length}):');
    for (final value in values) {
      stdout.writeln('  ${value is String ? value : jsonEncode(value)}');
    }
  }
}

final class _Inspector {
  _Inspector(this.root) : rootPath = root.path;

  final Directory root;
  final String rootPath;

  Map<String, Object> inspect() {
    final files = _collectFiles();
    final packages = <_Package>[];
    final dartFiles = <_DartFile>[];
    final changelogs = <String>[];
    final analysisOptions = <String>[];
    final projectCommands = <String>[];

    for (final file in files) {
      final relativePath = _relativePath(rootPath, file.path);
      final basename = _basename(relativePath);
      final lowerBasename = basename.toLowerCase();

      if (lowerBasename == 'pubspec.yaml') {
        packages.add(_parsePubspec(file, relativePath));
      }
      if (lowerBasename.endsWith('.dart') && !_isGeneratedDart(relativePath)) {
        dartFiles.add(_DartFile(file, relativePath));
      }
      if (RegExp(
        r'^changelog(?:\.[^/]+)?$',
        caseSensitive: false,
      ).hasMatch(basename)) {
        changelogs.add(relativePath);
      }
      if (lowerBasename == 'analysis_options.yaml' ||
          lowerBasename == 'analysis_options.yml') {
        analysisOptions.add(relativePath);
      }
      if (_isProjectCommandSource(relativePath)) {
        projectCommands.add(relativePath);
      }
    }

    packages.sort((left, right) => left.path.compareTo(right.path));
    dartFiles.sort((left, right) => left.path.compareTo(right.path));
    changelogs.sort();
    analysisOptions.sort();
    projectCommands.sort();

    final packageByCanonicalPath = <String, _Package>{
      for (final package in packages) package.canonicalPath: package,
    };
    final edges = _buildEdges(packages, packageByCanonicalPath);
    final largeDartFiles = _largeDartFiles(dartFiles);
    final barrels = _barrels(packages, dartFiles);
    final featureLayers = _featureLayers(dartFiles);
    final tests = _tests(dartFiles);

    return <String, Object>{
      'schemaVersion': 1,
      'root': rootPath,
      'flutterRoots': packages
          .where((package) => package.isFlutter)
          .map((package) => package.path)
          .toList(),
      'packageEdges': edges.map((edge) => edge.toJson()).toList(),
      'cycles': _cycles(packages, edges),
      'largeDartFiles': largeDartFiles,
      'barrels': barrels,
      'featureLayers': featureLayers,
      'tests': tests,
      'changelogs': changelogs,
      'analysisOptions': analysisOptions,
      'projectCommands': projectCommands,
    };
  }

  List<File> _collectFiles() {
    final files = <File>[];

    void visit(Directory directory) {
      List<FileSystemEntity> entities;
      try {
        entities = directory.listSync(followLinks: false);
      } on FileSystemException {
        return;
      }
      entities.sort((left, right) => left.path.compareTo(right.path));

      for (final entity in entities) {
        if (entity is File) {
          files.add(entity);
        } else if (entity is Directory && !_shouldSkipDirectory(entity)) {
          visit(entity);
        }
      }
    }

    visit(root);
    files.sort((left, right) => left.path.compareTo(right.path));
    return files;
  }

  bool _shouldSkipDirectory(Directory directory) {
    final relativePath = _relativePath(rootPath, directory.path);
    final segments = relativePath.split('/');
    final basename = segments.last;

    if (const {'.git', '.dart_tool', 'build'}.contains(basename)) {
      return true;
    }
    if (basename.startsWith('.') &&
        basename != '.github' &&
        basename != '.circleci') {
      return true;
    }
    if (const {
      '.gradle',
      '.pub-cache',
      '.symlinks',
      'DerivedData',
      'Pods',
      'ephemeral',
    }.contains(basename)) {
      return true;
    }
    return false;
  }

  _Package _parsePubspec(File pubspec, String relativePubspecPath) {
    final lines = pubspec.readAsLinesSync();
    var name = '';
    var dependencySection = false;
    var currentDependency = '';
    var currentDependencyIndent = -1;
    var flutterSdkDependency = false;
    final pathDependencies = <_PathDependency>[];

    for (final rawLine in lines) {
      final line = _withoutYamlComment(rawLine);
      if (line.trim().isEmpty) continue;

      final indent = line.length - line.trimLeft().length;
      final trimmed = line.trim();
      if (indent == 0) {
        dependencySection =
            trimmed == 'dependencies:' || trimmed == 'dev_dependencies:';
        currentDependency = '';
        currentDependencyIndent = -1;
        if (trimmed.startsWith('name:')) {
          name = _yamlScalar(trimmed.substring('name:'.length));
        }
        continue;
      }
      if (!dependencySection) continue;

      final keyMatch = RegExp(
        r'^([A-Za-z0-9_.-]+):(?:\s*(.*))?$',
      ).firstMatch(trimmed);
      if (keyMatch == null) continue;

      final key = keyMatch.group(1)!;
      final value = (keyMatch.group(2) ?? '').trim();
      if (currentDependency.isEmpty || indent <= currentDependencyIndent) {
        currentDependency = key;
        currentDependencyIndent = indent;
        if (currentDependency == 'flutter' && value.contains('sdk: flutter')) {
          flutterSdkDependency = true;
        }
        continue;
      }

      if (key == 'sdk' &&
          currentDependency == 'flutter' &&
          _yamlScalar(value) == 'flutter') {
        flutterSdkDependency = true;
      } else if (key == 'path') {
        final path = _yamlScalar(value);
        if (path.isNotEmpty) {
          pathDependencies.add(_PathDependency(currentDependency, path));
        }
      }
    }

    final packageDirectory = pubspec.parent.resolveSymbolicLinksSync();
    final packagePath = _relativePath(rootPath, packageDirectory);
    return _Package(
      name: name,
      path: packagePath,
      canonicalPath: packageDirectory,
      isFlutter: flutterSdkDependency,
      pathDependencies: pathDependencies,
    );
  }

  List<_Edge> _buildEdges(
    List<_Package> packages,
    Map<String, _Package> packageByCanonicalPath,
  ) {
    final edges = <_Edge>[];
    for (final package in packages) {
      for (final dependency in package.pathDependencies) {
        final targetPath = _resolveDependencyPath(
          package.canonicalPath,
          dependency.path,
        );
        final knownTarget = packageByCanonicalPath[targetPath];
        final relativeTarget =
            knownTarget?.path ?? _relativePath(rootPath, targetPath);
        edges.add(
          _Edge(
            from: package.path,
            to: relativeTarget,
            dependency: dependency.name,
          ),
        );
      }
    }
    edges.sort((left, right) {
      final pathOrder = left.from.compareTo(right.from);
      if (pathOrder != 0) return pathOrder;
      final targetOrder = left.to.compareTo(right.to);
      if (targetOrder != 0) return targetOrder;
      return left.dependency.compareTo(right.dependency);
    });
    return edges;
  }

  String _resolveDependencyPath(String declaringPath, String dependencyPath) {
    final baseUri = Uri.directory(declaringPath);
    final resolvedPath = baseUri.resolve(dependencyPath).toFilePath();
    final directory = Directory(resolvedPath);
    if (directory.existsSync()) {
      return directory.resolveSymbolicLinksSync();
    }
    return directory.absolute.path;
  }

  List<Map<String, Object>> _largeDartFiles(List<_DartFile> dartFiles) {
    final records = <Map<String, Object>>[];
    for (final dartFile in dartFiles) {
      final lineCount = _physicalLineCount(dartFile.file.readAsBytesSync());
      if (lineCount >= 250) {
        records.add({
          'path': dartFile.path,
          'lineCount': lineCount,
          'requiresJustification': lineCount >= 400,
        });
      }
    }
    records.sort(_compareRecordPaths);
    return records;
  }

  List<Map<String, Object>> _barrels(
    List<_Package> packages,
    List<_DartFile> dartFiles,
  ) {
    final dartPaths = {for (final dartFile in dartFiles) dartFile.path};
    final recordsByPath = <String, Map<String, Object>>{};

    for (final package in packages) {
      if (package.name.isEmpty) continue;
      final prefix = package.path == '.' ? '' : '${package.path}/';
      final entrypoint = '${prefix}lib/${package.name}.dart';
      if (dartPaths.contains(entrypoint)) {
        recordsByPath[entrypoint] = {
          'path': entrypoint,
          'kind': 'packageEntrypoint',
        };
      }
    }

    for (final dartFile in dartFiles) {
      final segments = dartFile.path.split('/');
      final featuresIndex = segments.indexOf('features');
      if (featuresIndex <= 0 || featuresIndex + 2 >= segments.length) continue;
      if (segments[featuresIndex - 1] != 'lib') continue;

      final filename = segments.last;
      final parentName = segments[segments.length - 2];
      if (filename == '$parentName.dart') {
        recordsByPath.putIfAbsent(
          dartFile.path,
          () => {'path': dartFile.path, 'kind': 'featureOrLayerCandidate'},
        );
      }
    }

    final records = recordsByPath.values.toList()..sort(_compareRecordPaths);
    return records;
  }

  List<Map<String, Object>> _featureLayers(List<_DartFile> dartFiles) {
    final records = <Map<String, Object>>[];
    for (final dartFile in dartFiles) {
      final segments = dartFile.path.split('/');
      for (var index = 0; index + 4 < segments.length; index++) {
        if (segments[index] == 'lib' && segments[index + 1] == 'features') {
          records.add({
            'path': dartFile.path,
            'feature': segments[index + 2],
            'layer': segments[index + 3],
          });
          break;
        }
      }
    }
    records.sort(_compareRecordPaths);
    return records;
  }

  List<String> _tests(List<_DartFile> dartFiles) {
    final tests =
        dartFiles
            .where((dartFile) {
              final segments = dartFile.path.split('/');
              return segments.contains('test') &&
                  segments.last.endsWith('_test.dart');
            })
            .map((dartFile) => dartFile.path)
            .toList()
          ..sort();
    return tests;
  }

  List<List<String>> _cycles(List<_Package> packages, List<_Edge> edges) {
    final knownNodes = {for (final package in packages) package.path};
    final graph = <String, List<String>>{
      for (final node in knownNodes) node: <String>[],
    };
    for (final edge in edges) {
      if (knownNodes.contains(edge.to)) {
        graph[edge.from]!.add(edge.to);
      }
    }
    for (final targets in graph.values) {
      targets.sort();
    }

    final visited = <String>{};
    final active = <String>{};
    final stack = <String>[];
    final cyclesByKey = <String, List<String>>{};

    void visit(String node) {
      visited.add(node);
      active.add(node);
      stack.add(node);

      for (final target in graph[node]!) {
        if (!visited.contains(target)) {
          visit(target);
        } else if (active.contains(target)) {
          final start = stack.indexOf(target);
          final cycle = [...stack.sublist(start), target];
          final canonical = _canonicalCycle(cycle);
          cyclesByKey[canonical.join('\u0000')] = canonical;
        }
      }

      stack.removeLast();
      active.remove(node);
    }

    final nodes = graph.keys.toList()..sort();
    for (final node in nodes) {
      if (!visited.contains(node)) visit(node);
    }

    final keys = cyclesByKey.keys.toList()..sort();
    return [for (final key in keys) cyclesByKey[key]!];
  }
}

List<String> _canonicalCycle(List<String> closedCycle) {
  final nodes = closedCycle.sublist(0, closedCycle.length - 1);
  List<String>? best;
  for (var index = 0; index < nodes.length; index++) {
    final rotated = [...nodes.sublist(index), ...nodes.sublist(0, index)];
    if (best == null || _compareStringLists(rotated, best) < 0) {
      best = rotated;
    }
  }
  return [...best!, best.first];
}

int _compareStringLists(List<String> left, List<String> right) {
  for (var index = 0; index < left.length; index++) {
    final comparison = left[index].compareTo(right[index]);
    if (comparison != 0) return comparison;
  }
  return left.length.compareTo(right.length);
}

int _physicalLineCount(List<int> bytes) {
  if (bytes.isEmpty) return 0;
  var count = 0;
  for (final byte in bytes) {
    if (byte == 10) count++;
  }
  if (bytes.last != 10) count++;
  return count;
}

bool _isGeneratedDart(String path) {
  final lowerPath = path.toLowerCase();
  final basename = _basename(lowerPath);
  if (const [
    '.g.dart',
    '.freezed.dart',
    '.gr.dart',
    '.mocks.dart',
  ].any(lowerPath.endsWith)) {
    return true;
  }
  if (RegExp(r'^app_localizations(?:_[^.]+)?\.dart$').hasMatch(basename)) {
    return true;
  }
  if (RegExp(r'^messages_(?:all|[a-z0-9_]+)\.dart$').hasMatch(basename)) {
    return true;
  }
  if (lowerPath.endsWith('/generated/l10n.dart')) return true;
  return lowerPath.contains('/generated/intl/');
}

bool _isProjectCommandSource(String path) {
  final lowerPath = path.toLowerCase();
  final basename = _basename(lowerPath);
  final segments = lowerPath.split('/');

  if (basename == 'melos.yaml' || basename == 'melos.yml') return true;
  if (basename == 'makefile' || basename == 'gnumakefile') return true;
  if (segments.first == 'scripts') return true;
  if (lowerPath.startsWith('.github/workflows/')) return true;
  return const {
    '.gitlab-ci.yml',
    '.gitlab-ci.yaml',
    'azure-pipelines.yml',
    'azure-pipelines.yaml',
    '.circleci/config.yml',
    '.circleci/config.yaml',
    'bitrise.yml',
    'bitrise.yaml',
    'codemagic.yml',
    'codemagic.yaml',
  }.contains(lowerPath);
}

String _withoutYamlComment(String line) {
  final commentStart = line.indexOf('#');
  return commentStart < 0 ? line : line.substring(0, commentStart);
}

String _yamlScalar(String value) {
  var scalar = value.trim();
  if (scalar.length >= 2 &&
      ((scalar.startsWith("'") && scalar.endsWith("'")) ||
          (scalar.startsWith('"') && scalar.endsWith('"')))) {
    scalar = scalar.substring(1, scalar.length - 1);
  }
  return scalar.trim();
}

String _basename(String path) {
  final normalized = path.replaceAll(Platform.pathSeparator, '/');
  return normalized.substring(normalized.lastIndexOf('/') + 1);
}

String _relativePath(String root, String path) {
  final normalizedRoot = root.replaceAll(Platform.pathSeparator, '/');
  final normalizedPath = path.replaceAll(Platform.pathSeparator, '/');
  if (normalizedPath == normalizedRoot) return '.';
  if (normalizedPath.startsWith('$normalizedRoot/')) {
    return normalizedPath.substring(normalizedRoot.length + 1);
  }

  final rootSegments = normalizedRoot.split('/');
  final pathSegments = normalizedPath.split('/');
  var common = 0;
  while (common < rootSegments.length &&
      common < pathSegments.length &&
      rootSegments[common] == pathSegments[common]) {
    common++;
  }
  return [
    ...List<String>.filled(rootSegments.length - common, '..'),
    ...pathSegments.sublist(common),
  ].join('/');
}

int _compareRecordPaths(Map<String, Object> left, Map<String, Object> right) {
  return (left['path']! as String).compareTo(right['path']! as String);
}

final class _Options {
  const _Options(this.root, this.format);

  final String root;
  final String format;
}

final class _DartFile {
  const _DartFile(this.file, this.path);

  final File file;
  final String path;
}

final class _Package {
  const _Package({
    required this.name,
    required this.path,
    required this.canonicalPath,
    required this.isFlutter,
    required this.pathDependencies,
  });

  final String name;
  final String path;
  final String canonicalPath;
  final bool isFlutter;
  final List<_PathDependency> pathDependencies;
}

final class _PathDependency {
  const _PathDependency(this.name, this.path);

  final String name;
  final String path;
}

final class _Edge {
  const _Edge({required this.from, required this.to, required this.dependency});

  final String from;
  final String to;
  final String dependency;

  Map<String, Object> toJson() {
    return {'from': from, 'to': to, 'dependency': dependency};
  }
}
