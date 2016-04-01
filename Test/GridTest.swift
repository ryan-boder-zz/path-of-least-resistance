import XCTest
@testable import PathOfLeastResistance

class GridTest: XCTestCase {
    
    let g = Grid([[1,2,3],[4,5,6],[7,8,9]])

    func testInitAndGetValid() {
        XCTAssertEqual(1, g.get((1,1)))
        XCTAssertEqual(2, g.get((1,2)))
        XCTAssertEqual(3, g.get((1,3)))
        XCTAssertEqual(4, g.get((2,1)))
        XCTAssertEqual(5, g.get((2,2)))
        XCTAssertEqual(6, g.get((2,3)))
        XCTAssertEqual(7, g.get((3,1)))
        XCTAssertEqual(8, g.get((3,2)))
        XCTAssertEqual(9, g.get((3,3)))
    }
    
    func testGetInvalidLowRow() {
        XCTAssertEqual(nil, g.get((0,1)))
    }
    
    func testGetInvalidHighRow() {
        XCTAssertEqual(nil, g.get((4,1)))
    }
    
    func testGetInvalidLowColumn() {
        XCTAssertEqual(nil, g.get((1,0)))
    }
    
    func testGetInvalidHighColumn() {
        XCTAssertEqual(nil, g.get((1,4)))
    }
    
    func testNavigateR1C1Right() {
        XCTAssertTrue((1,2) == g.right((1,1)))
    }
    
    func testNavigateR2C1Right() {
        XCTAssertTrue((2,2) == g.right((2,1)))
    }
    
    func testNavigateR3C1Right() {
        XCTAssertTrue((3,2) == g.right((3,1)))
    }
    
    func testNavigateR1C2Right() {
        XCTAssertTrue((1,3) == g.right((1,2)))
    }
    
    func testNavigateR2C2Right() {
        XCTAssertTrue((2,3) == g.right((2,2)))
    }
    
    func testNavigateR3C2Right() {
        XCTAssertTrue((3,3) == g.right((3,2)))
    }
    
    func testNavigateR1C3Right() {
        XCTAssertTrue(nil == g.right((1,3)))
    }
    
}
