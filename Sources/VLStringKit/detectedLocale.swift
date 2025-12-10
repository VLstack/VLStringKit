import NaturalLanguage

extension String
{
 public var detectedLanguageCode: String?
 {
  let language = NLLanguageRecognizer.dominantLanguage(for: self)
  if language != .undetermined { return language?.rawValue }

  return nil
 }

 public var detectedLocale: Locale?
 {
  guard let languageCode = self.detectedLanguageCode else { return nil }

  return Locale(identifier: languageCode)
 }
}
