import Foundation

public extension String
{
 /// Returns the pluralized form of the string based on the given count.
 ///
 /// The string is inflected in the app language. It is returned unchanged when the count
 /// calls for the singular, or when the inflection engine does not know the word.
 ///
 /// - Parameter count: The count to determine the pluralization form.
 /// - Returns: A string that reflects the appropriate pluralization for the given count.
 func pluralized(count: Double) -> String
 {
  self.pluralized(count: count,
                  language: Bundle.main.preferredLocalizations.first ?? "en")
 }

 /// Returns the pluralized form of the string based on the given count.
 ///
 /// - Parameter count: The count to determine the pluralization form.
 /// - Returns: A string that reflects the appropriate pluralization for the given count.
 func pluralized(count: Int) -> String
 {
  self.pluralized(count: Double(count))
 }
}

extension String
{
 /// Returns the pluralized form of the string based on the given count, inflected in the given language.
 ///
 /// - Parameters:
 ///   - count: The count to determine the pluralization form.
 ///   - language: The language identifier used for the inflection (for example "fr" or "en-GB").
 /// - Returns: A string that reflects the appropriate pluralization for the given count.
 func pluralized(count: Double,
                 language: String) -> String
 {
  guard !Self.isSingular(count, language: language) else { return self }

  var morphology = Morphology()
  morphology.number = .plural
  var attributed = AttributedString(self)
  attributed.inflect = InflectionRule(morphology: morphology)
  attributed.languageIdentifier = language

  return String(attributed.inflected().characters)
 }
}

private extension String
{
 // CLDR rules: French "one" for 0 <= n < 2, other languages "one" for exactly 1
 static func isSingular(_ count: Double,
                        language: String) -> Bool
 {
  switch Locale.Language(identifier: language).languageCode?.identifier
  {
   case "fr": return count >= 0 && count < 2
   default: return count == 1
  }
 }
}
