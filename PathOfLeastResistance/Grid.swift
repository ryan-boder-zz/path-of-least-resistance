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
    
    func right(coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c == matrix[0].count {
            return nil
        }
        return (r, c + 1)
    }
    
    func up(coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c == matrix[0].count {
            return nil
        }
        return (r == 1 ? matrix.count : r - 1, c + 1)
    }
    
}
