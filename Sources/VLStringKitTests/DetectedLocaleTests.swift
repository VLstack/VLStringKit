import Testing
@testable import VLStringKit

@Test("The language of a sentence is detected",
      arguments: [ ( "Bonjour, comment allez-vous aujourd'hui ?", "fr" ),
                   ( "Hello, how are you doing today?", "en" ),
                   ( "Hola, ¿cómo estás hoy?", "es" ),
                   ( "Guten Tag, wie geht es Ihnen heute?", "de" ),
                   ( "Buongiorno, come stai oggi?", "it" ),
                   ( "今日はいい天気ですね", "ja" ) ])
func detectedLanguageCode(text: String,
                          expected: String)
{
 #expect(text.detectedLanguageCode == expected)
 #expect(text.detectedLocale?.language.languageCode?.identifier == expected)
}

@Test("An empty string has no language")
func detectedLanguageEmpty()
{
 #expect("".detectedLanguageCode == nil)
 #expect("".detectedLocale == nil)
}
