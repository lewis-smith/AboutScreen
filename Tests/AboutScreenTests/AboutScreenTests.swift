import XCTest
@testable import AboutScreen

final class AboutScreenTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AboutScreen().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
