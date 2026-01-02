extension String
{
 public var htmlUnescaped: String
 {
  var decoded = self
  let entities = [
                  "&quot;": "\"",
                  "&amp;": "&",
                  "&apos;": "'",
                  "&lt;": "<",
                  "&gt;": ">",
                  "&nbsp;": " ",
                  "&deg;": "°",
                  "&copy;": "©",
                  "&rsquo;": "'",
                  "&lsquo;": "'",
                  "&rdquo;": "\"",
                  "&ldquo;": "\"",
                  "&ndash;": "–",
                  "&mdash;": "—"
                 ]

  for (entity, value) in entities
  {
   decoded = decoded.replacing(entity, with: value)
  }

  decoded = decoded.replacing(/&#(\d+);/)
  {
   match in
   let (_, codeString) = match.output
   if let code = UInt32(codeString),
      let scalar = UnicodeScalar(code)
   {
    return String(scalar)
   }

   // Si échec, on renvoie le texte d'origine
   return String(match.0)
  }

  let spaces = [
                "\u{00A0}", "\u{2000}", "\u{2001}", "\u{2002}", "\u{2003}",
                "\u{2004}", "\u{2005}", "\u{2006}", "\u{2007}", "\u{2008}",
                "\u{2009}", "\u{200A}", "\u{200B}", "\u{202F}", "\u{FEFF}"
               ]
  for space in spaces { decoded = decoded.replacing(space, with: " ") }


  return decoded.replacing("\u{00AD}", with: "") // Soft hyphen (invisible)
                .replacing("\u{2019}", with: "'") // Apostrophe typographique
                .replacing("\u{2013}", with: "-") // Tiret moyen
                .replacing("\u{2014}", with: "-") // Tiret long
                .trimmed
 }
}
