extension String
{
 /// Calculates the Levenshtein distance between two strings.
 ///
 /// The Levenshtein distance is a measure of the difference between two sequences.
 /// It is defined as the minimum number of single-character edits (insertions, deletions, or substitutions)
 /// required to change one string into the other.
 ///
 /// - Parameters:
 ///   - other: The string to compare against.
 ///   - caseInsensitive: A Boolean value indicating whether the comparison should ignore case.
 ///                      If set to `true`, the comparison will be case-insensitive; otherwise, it will be case-sensitive.
 /// - Returns: The Levenshtein distance as an integer. Returns `0` if the two strings are identical.
 public func levenshteinDistance(to other: String,
                                 caseInsensitive: Bool = false) -> Int
 {
  let source = caseInsensitive ? self.lowercased() : self
  let target = caseInsensitive ? other.lowercased() : other

  guard source != target
  else { return 0 }

  let sourceChars = Array(source)
  let targetChars = Array(target)
  let sourceLength = sourceChars.count
  let targetLength = targetChars.count

  var matrix = [ [Int] ](repeating: [Int](repeating: 0,
                                          count: targetLength + 1),
                         count: sourceLength + 1)

  for i in 0...sourceLength
  {
   matrix[i][0] = i
  }

  for j in 0...targetLength
  {
   matrix[0][j] = j
  }

  for i in 1...sourceLength
  {
   for j in 1...targetLength
   {
    if sourceChars[i - 1] == targetChars[j - 1]
    {
     matrix[i][j] = matrix[i - 1][j - 1]
    }
    else
    {
     matrix[i][j] = Swift.min(matrix[i - 1][j - 1], matrix[i - 1][j], matrix[i][j - 1]) + 1
    }
   }
  }

  return matrix[sourceLength][targetLength]
  }
}
