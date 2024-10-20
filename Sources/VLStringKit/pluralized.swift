import Foundation
import SwiftUI

public extension String
{
 /// Returns the pluralized form of the string based on the given count.
 ///
 /// - Parameter count: The count to determine the pluralization form.
 /// - Returns: A string that reflects the appropriate pluralization for the given count.
 func pluralized(count: Double) -> String
 {
  let inflected: String = String(AttributedString(localized: "^[\(count) \(self)](inflect: true)").characters)
  let replaceTarget: String = String(AttributedString(localized: "\(count)").characters)

  return inflected.replacingOccurrences(of: replaceTarget, with: "").trim()
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
