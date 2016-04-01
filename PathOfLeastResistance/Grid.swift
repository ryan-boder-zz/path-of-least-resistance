import Foundation

class Grid {
    
    var matrix: Array<Array<Int>>!
    
    init(_ matrix: Array<Array<Int>>) {
        self.matrix = matrix
    }
    
    func get(coords: (Int, Int)) -> Int! {
        let (x, y) = coords
        if x < 0 || x >= matrix.count || y < 0 || y >= matrix.count {
            return nil
        }
        return matrix[x][y]
    }
    
}
