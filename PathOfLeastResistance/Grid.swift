import Foundation

/**
 * Provides a navigateable grid.
 */
class Grid {
    
    var matrix: Array<Array<Int>>!
    
    init(_ matrix: Array<Array<Int>>) {
        self.matrix = matrix
    }
    
    var rows: Int {
        return matrix.count
    }
    
    var columns: Int {
        return matrix[0].count
    }
    
    /**
     * Returns the resistance at the given coordinates.
     */
    func get(coords: (Int, Int)) -> Int! {
        let (r, c) = coords
        if r <= 0 || r > matrix.count || c <= 0 || c > matrix[0].count {
            return nil
        }
        return matrix[r - 1][c - 1]
    }
    
    /**
     * Navigates straight to the right and returns the new point.
     */
    func right(coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c >= matrix[0].count {
            return nil
        }
        return (r, c + 1)
    }
    
    /**
     * Navigates up and to the right and returns the new point.
     */
    func up(coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c >= matrix[0].count {
            return nil
        }
        return (r == 1 ? matrix.count : r - 1, c + 1)
    }
    
    /**
     * Navigates down and to the right and returns the new point.
     */
    func down(coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c >= matrix[0].count {
            return nil
        }
        return (r == matrix.count ? 1 : r + 1, c + 1)
    }
    
}
