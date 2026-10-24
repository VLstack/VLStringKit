import Testing
@testable import VLStringKit

@Test("Only the first character is uppercased, the rest is lowercased",
      arguments: [ ( "", "" ),
                   ( "a", "A" ),
                   ( "hELLO wORLD", "Hello world" ),
                   ( "ÜBER", "Über" ),
                   ( "1abC", "1abc" ) ])
func firstCharacterCapitalized(text: String,
                               expected: String)
{
 #expect(text.firstCharacterCapitalized == expected)
}
