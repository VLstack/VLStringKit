import Foundation
import Testing
@testable import VLStringKit

@Test("trimmed removes spaces, tabs and newlines at both ends only")
func trimmedBothEnds()
{
 #expect("  a b \t\n".trimmed == "a b")
 #expect("\n\t ".trimmed == "")
 #expect("".trimmed == "")
}

@Test("trimmed removes non-breaking spaces")
func trimmedNonBreakingSpace()
{
 #expect("\u{00A0}a\u{00A0}".trimmed == "a")
}

@Test("trim uses the given character set")
func trimCharacterSet()
{
 #expect("xxaxx".trim(CharacterSet(charactersIn: "x")) == "a")
 #expect("  a  ".trim(.newlines) == "  a  ")
}
