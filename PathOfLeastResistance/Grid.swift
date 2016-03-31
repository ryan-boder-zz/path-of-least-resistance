import Foundation

class Grid {
    
    var matrix: Array<Array<Int>>!
    
    init(_ matrix: Array<Array<Int>>) {
        self.matrix = matrix
    }
    
    func get(coords: (Int, Int)) -> Int {
        let (x, y) = coords
        return matrix[x][y]
    }
    
}