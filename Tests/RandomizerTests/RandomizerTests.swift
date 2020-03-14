import XCTest
@testable import Randomizer

final class RandomizerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Randomizer().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
