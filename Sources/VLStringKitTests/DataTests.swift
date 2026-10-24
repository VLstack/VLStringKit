import Foundation
import Testing
@testable import VLStringKit

@Test("Valid Base64 is decoded")
func decodedBase64Valid()
{
 #expect("SGVsbG8=".decodedBase64Data == Data("Hello".utf8))
 #expect("".decodedBase64Data == Data())
}

@Test("Invalid Base64 gives nil")
func decodedBase64Invalid()
{
 #expect("not base64!".decodedBase64Data == nil)
}
