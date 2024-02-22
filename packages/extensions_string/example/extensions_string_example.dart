import 'package:lamob_dart_extensions_string/extensions_string.dart';

void main() {
  final String empty = '';
  print('Empty string: ${empty.isarFastHash()}');

  final String awesome = 'awesome';
  print('awesome string: ${awesome.isarFastHash()}');
}
