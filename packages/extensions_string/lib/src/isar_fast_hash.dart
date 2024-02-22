extension IsarFastHash on String {
  /// Generated a fast hash for Dart strings
  ///
  /// This function returns an integer hash value for the given string.
  /// this is the FNV-1a 64bit hash algorithm optimized for Dart Strings
  /// Useful for databases like isar which require id to be an integer
  ///
  /// Examples:
  /// ```dart
  /// print('example'.fastHash()); // Output: some int value
  /// ```
  ///
  /// Returns:
  ///   - [int] An integer hash value for the given string.
  ///
  /// See also:
  ///   - Isar doc : https://isar.dev/recipes/string_ids.html#fast-hash-function
  int isarFastHash() {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < length) {
      final codeUnit = codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
