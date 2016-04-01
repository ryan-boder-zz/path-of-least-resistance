import XCTest
@testable import PathOfLeastResistance

class PathFinderTest: XCTestCase {

    var out: PathFinder!
    
    override func setUp() {
        super.setUp()
        out = PathFinder()
    }
    
    func testWhenEmptyInputReturnNil() {
        let (success, resistance, path) = out.find([])
        XCTAssertFalse(success)
        XCTAssertEqual(0, resistance)
        XCTAssertEqual([], path)
    }
    
    func testWhenSingleRowSingleColumnInput() {
        let (success, resistance, path) = out.find([[4]])
        XCTAssertTrue(success)
        XCTAssertEqual(4, resistance)
        XCTAssertEqual([1], path)
    }
    
    func testWhenSingleRowSingleColumnInput2() {
        let (success, resistance, path) = out.find([[8]])
        XCTAssertTrue(success)
        XCTAssertEqual(8, resistance)
        XCTAssertEqual([1], path)
    }
    
    func testWhenSingleRowMultipleColumnInput() {
        let (success, resistance, path) = out.find([[1,2,3,4]])
        XCTAssertTrue(success)
        XCTAssertEqual(10, resistance)
        XCTAssertEqual([1,1,1,1], path)
    }
    
    func test2RowInput1() {
        let (success, resistance, path) = out.find([[1,2],[3,4]])
        XCTAssertTrue(success)
        XCTAssertEqual(3, resistance)
        XCTAssertEqual([1,1], path)
    }
    
    func test2RowInput2() {
        let (success, resistance, path) = out.find([[3,4],[1,2]])
        XCTAssertTrue(success)
        XCTAssertEqual(3, resistance)
        XCTAssertEqual([2,2], path)
    }
    
    func test2RowInput3() {
        let (success, resistance, path) = out.find([[1,4],[3,2]])
        XCTAssertTrue(success)
        XCTAssertEqual(3, resistance)
        XCTAssertEqual([1,2], path)
    }
    
    func test2RowInput4() {
        let (success, resistance, path) = out.find([[1,2,1,2,1],[2,1,2,1,2]])
        XCTAssertTrue(success)
        XCTAssertEqual(5, resistance)
        XCTAssertEqual([1,2,1,2,1], path)
    }
    
    func test3RowInput1() {
        let (success, resistance, path) = out.find([[1,2,3,2,1],[2,1,2,1,2],[4,4,1,4,4]])
        XCTAssertTrue(success)
        XCTAssertEqual(5, resistance)
        XCTAssertEqual([1,2,3,2,1], path)
    }
    
    func testResistanceTooHigh1() {
        let (success, resistance, path) = out.find([[10,10,10,10,11]])
        XCTAssertFalse(success)
        XCTAssertEqual(40, resistance)
        XCTAssertEqual([1,1,1,1], path)
    }
    
    func testGivenExample1() {
        let (success, resistance, path) = out.find([
            [3,4,1,2,8,6],
            [6,1,8,2,7,4],
            [5,9,3,9,9,5],
            [8,4,1,3,2,6],
            [3,7,2,8,6,4]
            ])
        XCTAssertTrue(success)
        XCTAssertEqual(16, resistance)
        XCTAssertEqual([1,2,3,4,4,5], path)
    }
    
    func testGivenExample2() {
        let (success, resistance, path) = out.find([
            [3,4,1,2,8,6],
            [6,1,8,2,7,4],
            [5,9,3,9,9,5],
            [8,4,1,3,2,6],
            [3,7,2,1,2,3]
            ])
        XCTAssertTrue(success)
        XCTAssertEqual(11, resistance)
        XCTAssertEqual([1,2,1,5,4,5], path)
    }
    
}
