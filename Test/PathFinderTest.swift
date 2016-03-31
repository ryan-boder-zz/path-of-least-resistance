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
    
    func testWhenSingleRowSingleColumnInput() {
        let (total, path) = out.find([[4]])
        XCTAssertEqual(4, total)
        XCTAssertEqual([1], path)
    }
    
    func testWhenSingleRowSingleColumnInput2() {
        let (total, path) = out.find([[8]])
        XCTAssertEqual(8, total)
        XCTAssertEqual([1], path)
    }
    
    func testWhenSingleRowMultipleColumnInput() {
        let (total, path) = out.find([[1,2,3,4]])
        XCTAssertEqual(10, total)
        XCTAssertEqual([1,1,1,1], path)
    }

}
