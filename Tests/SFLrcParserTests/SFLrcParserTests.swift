import XCTest
@testable import SFLrcParser

class SFLrcParserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SFLrcParser().text, "Hello, World!")
    }


    static var allTests : [(String, (SFLrcParserTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
