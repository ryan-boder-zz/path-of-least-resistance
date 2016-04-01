import XCTest
@testable import PathOfLeastResistance

class GridTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testInitAndGetValid() {
        let g = Grid([[1,2,3],[4,5,6],[7,8,9]])
        XCTAssertEqual(1, g.get((0,0)))
        XCTAssertEqual(2, g.get((0,1)))
        XCTAssertEqual(3, g.get((0,2)))
        XCTAssertEqual(4, g.get((1,0)))
        XCTAssertEqual(5, g.get((1,1)))
        XCTAssertEqual(6, g.get((1,2)))
        XCTAssertEqual(7, g.get((2,0)))
        XCTAssertEqual(8, g.get((2,1)))
        XCTAssertEqual(9, g.get((2,2)))
    }
    
    func testGetInvalidLowX() {
        let g = Grid([[1,2,3],[4,5,6],[7,8,9]])
        XCTAssertEqual(nil, g.get((-1,1)))
    }
    
}
