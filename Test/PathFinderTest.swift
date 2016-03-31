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
    
    func testWhenSingleInputReturnIt() {
        let (total, path) = out.find([[4]])
        XCTAssertEqual(4, total)
        XCTAssertEqual([1], path)
    }

}
