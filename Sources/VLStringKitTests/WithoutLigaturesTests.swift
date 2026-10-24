import Testing
@testable import VLStringKit

@Test("Each ligature is expanded",
      arguments: [ ( "œ", "oe" ), ( "Œ", "OE" ),
                   ( "æ", "ae" ), ( "Æ", "AE" ),
                   ( "ß", "ss" ), ( "ẞ", "SS" ),
                   ( "ĳ", "ij" ), ( "Ĳ", "IJ" ),
                   ( "ﬀ", "ff" ), ( "ﬁ", "fi" ), ( "ﬂ", "fl" ),
                   ( "ﬃ", "ffi" ), ( "ﬄ", "ffl" ), ( "ﬅ", "ft" ), ( "ﬆ", "st" ) ])
func withoutLigaturesEach(text: String,
                          expected: String)
{
 #expect(text.withoutLigatures == expected)
}

@Test("Latin digraphs keep the case of each letter",
      arguments: [ ( "\u{01F3}", "dz" ),            // ǳ
                   ( "\u{01F1}", "DZ" ),            // Ǳ
                   ( "\u{01F2}", "Dz" ),            // ǲ
                   ( "\u{01C6}", "d\u{017E}" ),     // ǆ → dž
                   ( "\u{01C4}", "D\u{017D}" ),     // Ǆ → DŽ
                   ( "\u{01C5}", "D\u{017E}" ) ])   // ǅ → Dž
func withoutLigaturesDigraphs(text: String,
                              expected: String)
{
 #expect(text.withoutLigatures == expected)
}

@Test("Text around ligatures is kept")
func withoutLigaturesSentence()
{
 #expect("Un cœur ﬁdèle".withoutLigatures == "Un coeur fidèle")
 #expect("".withoutLigatures == "")
}
