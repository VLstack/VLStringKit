import Testing
@testable import VLStringKit

@Test("Accents, case and spaces are normalized",
      arguments: [ ( "  Crème   Brûlée  ", "creme brulee" ),
                   ( "àéîõü", "aeiou" ),
                   ( "ñ ç ø", "n c o" ),
                   ( "a\n\tb", "a b" ) ])
func normalizedAccentsCaseSpaces(text: String,
                                 expected: String)
{
 #expect(text.normalized == expected)
}

@Test("Ligatures are expanded",
      arguments: [ ( "œuf", "oeuf" ),
                   ( "Œuf", "oeuf" ),
                   ( "æ", "ae" ),
                   ( "ﬁle", "file" ),
                   ( "ﬂeur", "fleur" ) ])
func normalizedLigatures(text: String,
                         expected: String)
{
 #expect(text.normalized == expected)
}

@Test("Typographic punctuation is simplified",
      arguments: [ ( "l\u{2019}eau", "l'eau" ),
                   ( "\u{2018}a", "'a" ),
                   ( "a\u{2026}", "a..." ),
                   ( "a\u{2013}b", "a-b" ) ])
func normalizedPunctuation(text: String,
                           expected: String)
{
 #expect(text.normalized == expected)
}

@Test("normalizedWords splits on non-letters and drops short words")
func normalizedWords()
{
 #expect("Crème brûlée, à la vanille !".normalizedWords() == [ "creme", "brulee", "la", "vanille" ])
 #expect("Crème brûlée, à la vanille !".normalizedWords(minCharacters: 4) == [ "creme", "brulee", "vanille" ])
 #expect("l'eau".normalizedWords() == [ "eau" ])
 #expect("".normalizedWords() == [])
}
