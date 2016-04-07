import XCTest
@testable import PathOfLeastResistance

class InputParserTest: XCTestCase {

    var out: InputParser!
    
    override func setUp() {
        super.setUp()
        out = InputParser()
    }
    
    func testEmptyInput() {
        XCTAssertEqual([], out.parse(""))
    }
    
    func testSingleValue() {
        XCTAssertEqual([[1]], out.parse("1"))
    }
    
    func testSingleRow() {
        XCTAssertEqual([[1,2,3]], out.parse("1 2 3"))
    }
    
    func testTwoRows() {
        XCTAssertEqual([[1,2,3],[4,5,6]], out.parse("1 2 3\n4 5 6"))
    }
    
    func testThreeRows() {
        XCTAssertEqual([[1,2,3],[4,5,6],[7,8,9]], out.parse("1 2 3\n4 5 6\n7 8 9"))
    }
    
}
