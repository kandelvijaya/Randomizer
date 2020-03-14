import XCTest
@testable import Randomizer

final class RandomizerTests: XCTestCase {
    
    func testRandomStringWithMinCountProducesRightResult() {
        let count = UInt.random
        let output = [String].random(atLeast: count)
        XCTAssert(output.count >= count)
    }

    static var allTests = [
        ("test random string wit max count works", testRandomStringWithMinCountProducesRightResult),
    ]
}
