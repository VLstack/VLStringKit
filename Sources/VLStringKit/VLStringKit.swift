import Foundation
import SwiftUI

public extension String
{
 func pluralized(count: Double) -> String
 {
  let inflected: String = String(AttributedString(localized: "^[\(count) \(self)](inflect: true)").characters)
  let replaceTarget: String = String(AttributedString(localized: "^[\(count)](inflect: true)").characters)
  
  return inflected.replacingOccurrences(of: replaceTarget, with: "").trim()
 }
 
 func pluralized(count: Int) -> String
 {
  self.pluralized(count: Double(count))
 }

 func trim(_ set: CharacterSet = .whitespacesAndNewlines) -> String
 {
  self.trimmingCharacters(in: set)
 }
}

public extension LocalizedStringKey
{
 func toString() -> String
 {
  let mirror = Mirror(reflecting: self)
  let str = mirror.children.first { $0.label == "key" }?.value as? String

  return str ?? ""
 }
}
