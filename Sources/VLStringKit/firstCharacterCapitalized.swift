extension String
{
 /// Returns a new string where the first character is uppercased and all remaining characters are lowercased.
 ///
 /// If the string is empty, the original string is returned unchanged.
 ///
 /// - Returns: A new string with the first character uppercased and the rest lowercased.
 @inlinable
 public var firstCharacterCapitalized: String
 {
  guard let firstLetter = self.first?.uppercased()
  else { return self }

  return firstLetter + self.dropFirst().lowercased()
 }
}
