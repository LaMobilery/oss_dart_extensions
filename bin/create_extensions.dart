// This is a simple Dart script to run `dart create -t package` with a given package name.

import 'dart:async';
import 'dart:io';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('No package name provided.');
    exit(1);
  }

  final packageName = arguments[0].toLowerCase();
  final onlyLettersRegex = RegExp(r'^[a-z]+$');
  if (!onlyLettersRegex.hasMatch(packageName)) {
    print('Package name must only contain letters.');
    exit(1);
  }

  // Go in packages directory
  final workspacePath = Directory.current.path;
  Directory.current = '${workspacePath}/packages';
  final result = await Process.run(
      'dart', ['create', '-t', 'package', 'extensions_$packageName']);

  print(result.stdout);
  if (result.stderr.isNotEmpty) {
    print('Error: ${result.stderr}');
    exit(2);
  }

  // Now update the pubspec.yaml of the newly created project to update the name
  final pubspecFile = File('extensions_$packageName/pubspec.yaml');
  final pubspecContent = await pubspecFile.readAsString();
  final newPubspecContent = pubspecContent.replaceFirst(
      'name: extensions_$packageName',
      'name: lamob_dart_extensions_$packageName');
  await pubspecFile.writeAsString(newPubspecContent);

  // Now erase the current README.md with the one in assets/EXTENSION_README.md
  final readmeFile = File('extensions_$packageName/README.md');
  await readmeFile.writeAsString(
      (await File('../assets/EXTENSION_README.md').readAsString())
          .replaceAll('\$CLASS', packageName));

  // Now update the packages in the example and test folders dart files
  final dartFilesPaths = ['example', 'test']
      .map((e) => Directory('extensions_$packageName/$e'))
      .map((e) => e.listSync().whereType<File>().map((e) => e.path))
      .expand((element) => element)
      .where((path) => path.endsWith('.dart'));

  for (final path in dartFilesPaths) {
    final fileContent = await File(path).readAsString();
    final newFileContent = fileContent.replaceAll(
        'extensions_$packageName/extensions_$packageName',
        'lamob_dart_extensions_$packageName/extensions_$packageName');
    await File(path).writeAsString(newFileContent);
  }

  // Back to root
  Directory.current = workspacePath;

  // Finally run bootstrap
  final bootstrapResult = await Process.run('melos', ['bootstrap']);
  print(bootstrapResult.stdout);
  if (bootstrapResult.stderr.isNotEmpty) {
    print('Error: ${bootstrapResult.stderr}');
    exit(3);
  }
}
