import Testing
@testable import VLStringKit

@Test("Known distances",
      arguments: [ ( "kitten", "sitting", 3 ),
                   ( "flaw", "lawn", 2 ),
                   ( "gumbo", "gambol", 2 ),
                   ( "abc", "abc", 0 ) ])
func levenshteinKnownDistances(source: String,
                               target: String,
                               expected: Int)
{
 #expect(source.levenshteinDistance(to: target) == expected)
 #expect(target.levenshteinDistance(to: source) == expected)
}

@Test("An empty string is at the length of the other string",
      arguments: [ ( "", "abc", 3 ),
                   ( "abc", "", 3 ),
                   ( "", "", 0 ) ])
func levenshteinEmpty(source: String,
                      target: String,
                      expected: Int)
{
 #expect(source.levenshteinDistance(to: target) == expected)
}

@Test("Case is ignored only when asked")
func levenshteinCase()
{
 #expect("ABC".levenshteinDistance(to: "abc") == 3)
 #expect("ABC".levenshteinDistance(to: "abc", caseInsensitive: true) == 0)
}

@Test("Precomposed and decomposed accents are the same character")
func levenshteinUnicode()
{
 #expect("\u{E9}".levenshteinDistance(to: "e\u{301}") == 0)
}
