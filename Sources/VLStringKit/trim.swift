import Foundation

public extension String
{
 /// Removes whitespace and newline characters from both ends of the string.
 ///
 /// - Parameter set: A character set to trim. Defaults to .whitespacesAndNewlines.
 /// - Returns: A trimmed string with specified characters removed from both ends.
 @inlinable
 func trim(_ set: CharacterSet = .whitespacesAndNewlines) -> String
 {
  self.trimmingCharacters(in: set)
 }

 /// A version of the string with leading whitespaces, trailing whitespaces and newlines removed.
 ///
 /// - Returns: A trimmed string
 @inlinable
 var trimmed: String
 {
  self.trim()
 }
}
