import Testing
@testable import VLStringKit

@Test("French counts below 2 keep the singular",
      arguments: [ 0, 1, 1.5, 1.99 ])
func pluralizedFrenchSingular(count: Double)
{
 #expect("pomme".pluralized(count: count, language: "fr") == "pomme")
}

@Test("French counts from 2 use the plural",
      arguments: [ 2, 2.5, 10 ])
func pluralizedFrenchPlural(count: Double)
{
 #expect("pomme".pluralized(count: count, language: "fr") == "pommes")
}

@Test("English only keeps the singular for exactly 1",
      arguments: [ ( 0.0, "apples" ), ( 1.0, "apple" ), ( 1.5, "apples" ), ( 2.0, "apples" ) ])
func pluralizedEnglish(count: Double,
                       expected: String)
{
 #expect("apple".pluralized(count: count, language: "en") == expected)
}

@Test("A count of 1 returns the text unchanged",
      arguments: [ "fr", "en", "es", "de", "it", "ja" ])
func pluralizedOne(language: String)
{
 #expect("apple".pluralized(count: 1, language: language) == "apple")
}

@Test("Plural forms in each app language",
      arguments: [ ( "cuillère à soupe", "fr", "cuillères à soupe" ),
                   ( "pomme d'api", "fr", "pommes d'api" ),
                   ( "tablespoon", "en", "tablespoons" ),
                   ( "manzana", "es", "manzanas" ),
                   ( "cucharada", "es", "cucharadas" ),
                   ( "Apfel", "de", "Äpfel" ),
                   ( "Esslöffel", "de", "Esslöffel" ),
                   ( "mela", "it", "mele" ),
                   ( "cucchiaio", "it", "cucchiai" ),
                   ( "りんご", "ja", "りんご" ),
                   ( "大さじ", "ja", "大さじ" ) ])
func pluralizedLanguages(text: String,
                         language: String,
                         expected: String)
{
 #expect(text.pluralized(count: 2, language: language) == expected)
}

@Test("Markdown characters are kept as typed",
      arguments: [ "pomme]", "*sel*", "pâte_brisée" ])
func pluralizedMarkdownCharacters(text: String)
{
 #expect(text.pluralized(count: 2, language: "fr") == text)
}

@Test("A number inside the text is kept")
func pluralizedNumberInText()
{
 #expect("vitamine B2".pluralized(count: 2, language: "fr").hasSuffix("B2"))
}

@Test("A regional language uses the rule of its language")
func pluralizedRegionalLanguage()
{
 #expect("pomme".pluralized(count: 1.5, language: "fr-CA") == "pomme")
 #expect("pomme".pluralized(count: 2, language: "fr-CA") == "pommes")
}

@Test("The Int version gives the same result as the Double version")
func pluralizedInt()
{
 #expect("apple".pluralized(count: 2) == "apple".pluralized(count: 2.0))
 #expect("apple".pluralized(count: 1) == "apple".pluralized(count: 1.0))
}
