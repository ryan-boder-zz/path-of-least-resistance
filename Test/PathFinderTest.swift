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
    
    func test2RowInput1() {
        let (total, path) = out.find([[1,2],[3,4]])
        XCTAssertEqual(3, total)
        XCTAssertEqual([1,1], path)
    }
    
    func test2RowInput2() {
        let (total, path) = out.find([[3,4],[1,2]])
        XCTAssertEqual(3, total)
        XCTAssertEqual([2,2], path)
    }
    
    func test2RowInput3() {
        let (total, path) = out.find([[1,4],[3,2]])
        XCTAssertEqual(3, total)
        XCTAssertEqual([1,2], path)
    }
    
    func test2RowInput4() {
        let (total, path) = out.find([[1,2,1,2,1],[2,1,2,1,2]])
        XCTAssertEqual(5, total)
        XCTAssertEqual([1,2,1,2,1], path)
    }
    
    func test3RowInput1() {
        let (total, path) = out.find([[1,2,3,2,1],[2,1,2,1,2],[4,4,1,4,4]])
        XCTAssertEqual(5, total)
        XCTAssertEqual([1,2,3,2,1], path)
    }
    
    func testGivenExample1() {
        let (total, path) = out.find([
            [3,4,1,2,8,6],
            [6,1,8,2,7,4],
            [5,9,3,9,9,5],
            [8,4,1,3,2,6],
            [3,7,2,8,6,4]
            ])
        XCTAssertEqual(16, total)
        XCTAssertEqual([1,2,3,4,4,5], path)
    }
    
    func testGivenExample2() {
        let (total, path) = out.find([
            [3,4,1,2,8,6],
            [6,1,8,2,7,4],
            [5,9,3,9,9,5],
            [8,4,1,3,2,6],
            [3,7,2,1,2,3]
            ])
        XCTAssertEqual(11, total)
        XCTAssertEqual([1,2,1,5,4,5], path)
    }
    
}
