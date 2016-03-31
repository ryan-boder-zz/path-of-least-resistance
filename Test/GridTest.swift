import XCTest
@testable import PathOfLeastResistance

class GridTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testInitAndGet() {
        let g = Grid([[1,2,3],[4,5,6],[7,8,9]])
        XCTAssertEqual(1, g.get((0,0)))
    }

}
