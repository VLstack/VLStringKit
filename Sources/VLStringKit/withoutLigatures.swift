extension String
{
 var withoutLigatures: String
 {
  var result = self

  // MARK: Ligatures historiques / Typographiques
  // MARK: - Français/Anglais/Latin
  result = result.replacingOccurrences(of: "œ", with: "oe") // U+0153 (oe)
  result = result.replacingOccurrences(of: "Œ", with: "OE") // U+0152 (OE)
  result = result.replacingOccurrences(of: "æ", with: "ae") // U+00E6 (ae)
  result = result.replacingOccurrences(of: "Æ", with: "AE") // U+00C6 (AE)

  // MARK: - Allemand (Esszett)
  result = result.replacingOccurrences(of: "ß", with: "ss") // U+00DF (ss)
  result = result.replacingOccurrences(of: "ẞ", with: "SS") // U+1E9E (SS)

  // MARK: - Néerlandais (ij)
  result = result.replacingOccurrences(of: "ĳ", with: "ij") // U+0133 (ij)
  result = result.replacingOccurrences(of: "Ĳ", with: "IJ") // U+0132 (IJ)

  // MARK: - Ligatures typographiques universelles
  result = result.replacingOccurrences(of: "ﬀ", with: "ff")  // U+FB00
  result = result.replacingOccurrences(of: "ﬁ", with: "fi")  // U+FB01
  result = result.replacingOccurrences(of: "ﬂ", with: "fl")  // U+FB02
  result = result.replacingOccurrences(of: "ﬃ", with: "ffi") // U+FB03
  result = result.replacingOccurrences(of: "ﬄ", with: "ffl") // U+FB04
  result = result.replacingOccurrences(of: "ﬅ", with: "ft")  // U+FB05
  result = result.replacingOccurrences(of: "ﬆ", with: "st")  // U+FB06

  // MARK: - Ligatures digrammes latins
  result = result.replacingOccurrences(of: "ǳ", with: "dz")  // U+01F3 (dz)
  result = result.replacingOccurrences(of: "Ǆ", with: "DZ")  // U+01C4 (DZ)
  result = result.replacingOccurrences(of: "ǆ", with: "dž")  // U+01C6 (dž)
  result = result.replacingOccurrences(of: "ǅ", with: "DŽ")  // U+01C5 (DŽ)

  return result
 }
}
