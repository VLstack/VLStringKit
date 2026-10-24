extension String
{
 public var withoutLigatures: String
 {
  var result = self

  // MARK: - Historical / typographic ligatures
  // MARK: - French / English / Latin
  result = result.replacingOccurrences(of: "œ", with: "oe") // U+0153 (oe)
  result = result.replacingOccurrences(of: "Œ", with: "OE") // U+0152 (OE)
  result = result.replacingOccurrences(of: "æ", with: "ae") // U+00E6 (ae)
  result = result.replacingOccurrences(of: "Æ", with: "AE") // U+00C6 (AE)

  // MARK: - German (Eszett)
  result = result.replacingOccurrences(of: "ß", with: "ss") // U+00DF (ss)
  result = result.replacingOccurrences(of: "ẞ", with: "SS") // U+1E9E (SS)

  // MARK: - Dutch (ij)
  result = result.replacingOccurrences(of: "ĳ", with: "ij") // U+0133 (ij)
  result = result.replacingOccurrences(of: "Ĳ", with: "IJ") // U+0132 (IJ)

  // MARK: - Universal typographic ligatures
  result = result.replacingOccurrences(of: "ﬀ", with: "ff")  // U+FB00
  result = result.replacingOccurrences(of: "ﬁ", with: "fi")  // U+FB01
  result = result.replacingOccurrences(of: "ﬂ", with: "fl")  // U+FB02
  result = result.replacingOccurrences(of: "ﬃ", with: "ffi") // U+FB03
  result = result.replacingOccurrences(of: "ﬄ", with: "ffl") // U+FB04
  result = result.replacingOccurrences(of: "ﬅ", with: "ft")  // U+FB05
  result = result.replacingOccurrences(of: "ﬆ", with: "st")  // U+FB06

  // MARK: - Latin digraphs (each letter keeps its case)
  result = result.replacingOccurrences(of: "\u{01F3}", with: "dz")        // ǳ
  result = result.replacingOccurrences(of: "\u{01F2}", with: "Dz")        // ǲ
  result = result.replacingOccurrences(of: "\u{01F1}", with: "DZ")        // Ǳ
  result = result.replacingOccurrences(of: "\u{01C6}", with: "d\u{017E}") // ǆ → dž
  result = result.replacingOccurrences(of: "\u{01C5}", with: "D\u{017E}") // ǅ → Dž
  result = result.replacingOccurrences(of: "\u{01C4}", with: "D\u{017D}") // Ǆ → DŽ

  return result
 }
}
