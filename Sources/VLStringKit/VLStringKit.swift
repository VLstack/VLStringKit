import Foundation

public
extension String
{
 func trim(_ set: CharacterSet = .whitespacesAndNewlines) -> String
 {
  self.trimmingCharacters(in: set)
 }
}
