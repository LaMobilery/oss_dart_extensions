import 'package:lamob_dart_extensions_string/extensions_string.dart';
import 'package:test/test.dart';

void main() {
  group('First Capital Letter Test', () {
    test('Runs on empty string and returns empty string', () {
      expect(''.firstCapitalLetter(), '');
    });

    test(
        'Capitalizes the first letter (lower) and leaves the rest of the string unchanged',
        () {
      expect('eXaMpLe'.firstCapitalLetter(), 'EXaMpLe');
    });

    test(
        'Capitalizes the first letter (upper) and leaves the rest of the string unchanged',
        () {
      expect('EXaMpLe'.firstCapitalLetter(), 'EXaMpLe');
    });

    test(
        'Capitalizes the first letter (upper) and converts the rest of the string to lowercase',
        () {
      expect('EXaMpLe'.firstCapitalLetter(lowerCaseAfter: true), 'Example');
    });
  });
}
