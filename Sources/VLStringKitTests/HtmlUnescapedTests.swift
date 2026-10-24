import Testing
@testable import VLStringKit

@Test("Named entities",
      arguments: [ ( "&quot;a&quot;", "\"a\"" ),
                   ( "a &amp; b", "a & b" ),
                   ( "&lt;b&gt;", "<b>" ),
                   ( "l&apos;eau", "l'eau" ),
                   ( "20&deg;", "20°" ),
                   ( "&copy; VLstack", "© VLstack" ),
                   ( "l&rsquo;eau", "l'eau" ),
                   ( "&lsquo;a", "'a" ),
                   ( "&ldquo;a&rdquo;", "\"a\"" ),
                   ( "a&ndash;b", "a-b" ),
                   ( "a&mdash;b", "a-b" ),
                   ( "a&nbsp;b", "a b" ) ])
func htmlUnescapedNamedEntities(text: String,
                                expected: String)
{
 #expect(text.htmlUnescaped == expected)
}

@Test("An escaped entity is decoded only once")
func htmlUnescapedOnce()
{
 #expect("&amp;lt;".htmlUnescaped == "&lt;")
 #expect("&amp;amp;".htmlUnescaped == "&amp;")
 #expect("&amp;#39;".htmlUnescaped == "&#39;")
}

@Test("Decimal entities",
      arguments: [ ( "l&#39;eau", "l'eau" ),
                   ( "caf&#233;", "café" ) ])
func htmlUnescapedDecimalEntities(text: String,
                                  expected: String)
{
 #expect(text.htmlUnescaped == expected)
}

@Test("Hexadecimal entities",
      arguments: [ ( "l&#x27;eau", "l'eau" ),
                   ( "caf&#xE9;", "café" ),
                   ( "caf&#xe9;", "café" ) ])
func htmlUnescapedHexadecimalEntities(text: String,
                                      expected: String)
{
 #expect(text.htmlUnescaped == expected)
}

@Test("An invalid code is left as is")
func htmlUnescapedInvalidCode()
{
 #expect("&#99999999;".htmlUnescaped == "&#99999999;")
}

@Test("Special spaces become plain spaces, soft hyphens are removed")
func htmlUnescapedSpaces()
{
 #expect("a\u{00A0}b".htmlUnescaped == "a b")
 #expect("a\u{202F}b".htmlUnescaped == "a b")
 #expect("a\u{2009}b".htmlUnescaped == "a b")
 #expect("a\u{00AD}b".htmlUnescaped == "ab")
}

@Test("Typographic apostrophes and dashes are simplified, ends are trimmed")
func htmlUnescapedTypography()
{
 #expect("l\u{2019}eau".htmlUnescaped == "l'eau")
 #expect("a\u{2013}b\u{2014}c".htmlUnescaped == "a-b-c")
 #expect("  a  ".htmlUnescaped == "a")
}
