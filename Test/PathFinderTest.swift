import XCTest
@testable import PathOfLeastResistance

class PathFinderTest: XCTestCase {

    var out: PathFinder!
    
    override func setUp() {
        super.setUp()
        out = PathFinder()
    }
    
    func testWhenEmptyInputReturnNil() {
        let (total, path) = out.find([])
        XCTAssertNil(total)
        XCTAssertEqual([], path)
    }

}
