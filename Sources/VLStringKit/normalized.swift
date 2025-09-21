extension String
{
 /// Normalizes the string by trimming whitespace, folding diacritics,
 /// and replacing specific characters with their normalized equivalents.
 ///
 /// - Returns: A normalized string with diacritics removed, whitespace condensed,
 /// and specific characters replaced.
 public var normalized: String
 {
  var result: String = self.trim()
                           .folding(options: [ .diacriticInsensitive, .caseInsensitive ],
                                    locale: .current)
                           .replacing(#/\s+/#, with: " ")

  for ( key, values ) in String.normalizedReplacements
  {
   for value in values
   {
    result = result.replacingOccurrences(of: value, with: key)
   }
  }

  return result.trim()
 }

 private static let normalizedReplacements: [ String: [ String ] ] =
 {
  [
   "a": [ "à", "á", "â", "ä", "ā", "å" ],
   "ae": [ "æ" ],
   "c": [ "ç" ],
   "e": [ "é", "ê", "ë", "è", "ė", "ē", "ę" ],
   "ff": [ "ﬀ" ],
   "ffi": [ "ﬃ" ],
   "fl": [ "ﬂ" ],
   "i": [ "ì", "í", "î", "ï" ],
   "ij": [ "ĳ" ],
   "n": [ "ñ" ],
   "o": [ "ô", "ó", "ò", "ö", "ō", "ø" ],
   "oe": [ "œ" ],
   "u": [ "ù", "û", "ú", "ü", "ū" ],
   "y": [ "ÿ" ],
   "...": [ "…" ],
   "-": [ "–" ],
   "'": [ "’", "‘", "'" ]
  ]
 }()

 /// Splits the normalized string into words and filters out short tokens.
 ///
 /// - Parameter minCharacters: The minimum word length to include (default is 2).
 /// - Returns: An array of words extracted from the normalized string.
 ///
 /// - Note: Non-alphanumeric characters are used as delimiters.
 public func normalizedWords(minCharacters: Int = 2) -> [ String ]
 {
  self.normalized.split(separator: /\W+/)
                 .map { String($0) }
                 .filter { $0.count >= minCharacters }
 }
}
