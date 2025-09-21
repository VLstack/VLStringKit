import Foundation

extension String
{
 // MARK: - Public API
 /// Attempts to decode the string as a Base64-encoded value and returns the resulting `Data`.
 ///
 /// - Returns: A `Data` instance if the string is a valid Base64 representation, otherwise `nil`.
 @inlinable
 public var decodedBase64Data: Data?
 {
  Data(base64Encoded: self)
 }

 // MARK: - Deprecated API
 @available(*, deprecated, renamed: "decodedBase64Data")
 public var dataBase64: Data?
 {
  decodedBase64Data
 }
}
