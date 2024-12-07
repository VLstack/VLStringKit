import Foundation

extension String
{
 var dataBase64: Data?
 {
  Data(base64Encoded: self)
 }
}
