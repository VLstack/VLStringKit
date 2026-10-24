extension String
{
 public var htmlUnescaped: String
 {
  // "&amp;" is replaced last, after the numeric entities, so that "&amp;lt;" or "&amp;#39;" are decoded only once
  let entities: [ ( entity: String, value: String ) ] =
  [
   ( "&quot;", "\"" ),
   ( "&apos;", "'" ),
   ( "&lt;", "<" ),
   ( "&gt;", ">" ),
   ( "&nbsp;", " " ),
   ( "&deg;", "°" ),
   ( "&copy;", "©" ),
   ( "&rsquo;", "'" ),
   ( "&lsquo;", "'" ),
   ( "&rdquo;", "\"" ),
   ( "&ldquo;", "\"" ),
   ( "&ndash;", "–" ),
   ( "&mdash;", "—" )
  ]

  var decoded = self
  for ( entity, value ) in entities
  {
   decoded = decoded.replacing(entity, with: value)
  }

  // Decimal entities (&#39;)
  decoded = decoded.replacing(/&#(\d+);/)
  {
   match in
   Self.htmlCharacter(code: UInt32(match.output.1), original: match.output.0)
  }

  // Hexadecimal entities (&#x27;)
  decoded = decoded.replacing(/&#[xX]([0-9A-Fa-f]+);/)
  {
   match in
   Self.htmlCharacter(code: UInt32(match.output.1, radix: 16), original: match.output.0)
  }

  decoded = decoded.replacing("&amp;", with: "&")

  let spaces = [
                "\u{00A0}", "\u{2000}", "\u{2001}", "\u{2002}", "\u{2003}",
                "\u{2004}", "\u{2005}", "\u{2006}", "\u{2007}", "\u{2008}",
                "\u{2009}", "\u{200A}", "\u{200B}", "\u{202F}", "\u{FEFF}"
               ]
  for space in spaces { decoded = decoded.replacing(space, with: " ") }

  return decoded.replacing("\u{00AD}", with: "") // Soft hyphen (invisible)
                .replacing("\u{2019}", with: "'") // Typographic apostrophe
                .replacing("\u{2013}", with: "-") // En dash
                .replacing("\u{2014}", with: "-") // Em dash
                .trimmed
 }
}

private extension String
{
 // Returns the character of a Unicode code, or the original entity when the code is invalid
 static func htmlCharacter(code: UInt32?,
                           original: Substring) -> String
 {
  guard let code,
        let scalar = UnicodeScalar(code)
  else { return String(original) }

  return String(scalar)
 }
}
