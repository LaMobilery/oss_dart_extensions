import 'package:lamob_dart_extensions_string/extensions_string.dart';
import 'package:test/test.dart';

void main() {
  group('FastHash Test', () {
    test('Runs on empty string', () {
      expect(''.isarFastHash(), -3750763034362895579);
    });

    test('Runs on uuid v4', () {
      expect(
        //lorem ipsum
        '68cdce72-91cf-4188-a456-ce6800279f64'.isarFastHash(),
        anything,
      );
    });

    test('Runs on uuid v7', () {
      expect(
        //lorem ipsum
        '018dd131-b74e-78f4-ad1b-ec59e338c8e5'.isarFastHash(),
        anything,
      );
    });

    test('Runs on guid', () {
      expect(
        //lorem ipsum
        'd333b725-4bd2-4242-880d-8ecd0adc2ac9'.isarFastHash(),
        anything,
      );
    });
  });
}
