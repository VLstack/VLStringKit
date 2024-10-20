extension String
{
 public var firstCharacterCapitalized: String
 {
  /// Returns a new string with the first character capitalized and the remaining characters in lowercase.
  ///
  /// If the string is empty, it returns the original string.
  ///
  /// - Returns: A string with the first character capitalized and the rest in lowercase.
  guard let firstLetter = self.first?.uppercased()
  else { return self }

  return firstLetter + self.dropFirst().lowercased()
 }
}
