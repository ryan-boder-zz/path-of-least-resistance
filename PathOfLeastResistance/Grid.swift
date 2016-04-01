import Foundation

class Grid {
    
    var matrix: Array<Array<Int>>!
    
    init(_ matrix: Array<Array<Int>>) {
        self.matrix = matrix
    }
    
    func get(coords: (Int, Int)) -> Int! {
        let (r, c) = coords
        if r <= 0 || r > matrix.count || c <= 0 || c > matrix[0].count {
            return nil
        }
        return matrix[r - 1][c - 1]
    }
    
}
