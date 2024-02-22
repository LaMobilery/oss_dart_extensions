extension FirstCapitalLetter on String {
  /// Capitalizes the first letter and optionally converts the rest of the string to lowercase.
  ///
  /// This function returns a new string with the first letter capitalized.
  /// If the `lowerCaseAfter` parameter is set to true, all characters following the first letter
  /// will be converted to lowercase. Otherwise, the rest of the string remains unchanged.
  ///
  /// Examples:
  /// ```dart
  /// // Capitalize the first letter without altering the rest of the string.
  /// print(firstCapitalLetter('example')); // Output: "Example"
  ///
  /// // Capitalize the first letter and convert the rest to lowercase.
  /// print(firstCapitalLetter('eXAMPLE', lowerCaseAfter: true)); // Output: "Example"
  /// ```
  ///
  /// Parameters:
  ///   - [bool] `lowerCaseAfter` (optional) Whether to convert characters following the first letter to lowercase. Defaults to `false`.
  ///
  /// Returns:
  ///   - [String] A new string with the first letter capitalized and optionally the rest of the string in lowercase.
  String firstCapitalLetter({
    bool lowerCaseAfter = false,
  }) {
    if (isEmpty) return '';
    return this[0].toUpperCase() +
        (lowerCaseAfter ? substring(1).toLowerCase() : substring(1));
  }
}
