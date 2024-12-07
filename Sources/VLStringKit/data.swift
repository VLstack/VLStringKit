import Foundation

extension String
{
 public var dataBase64: Data?
 {
  Data(base64Encoded: self)
 }
}
