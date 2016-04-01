import Foundation

class PathFinder {
    
    init() {
    }
    
    func find(grid: Array<Array<Int>>) -> (Bool, Int, Array<Int>) {
        if grid == [] {
            return (false, 0, [])
        }
        
        let g = Grid(grid)
        var least: (Bool, Int, Array<Int>)! = nil
        for row in 1...g.rows {
            let rowLeast = findFrom(g, 0, [], (row, 1))
            if (least == nil || rowLeast.1 < least.1) {
                least = rowLeast
            }
        }
        
        return least
    }
    
    func findFrom(g: Grid, _ prevResistance: Int, _ prevPath: Array<Int>, _ coords: (Int, Int)) -> (Bool, Int, Array<Int>) {
        let resistance = prevResistance + g.get(coords)
        let (r, c) = coords
        let path = prevPath + [r]
        
        if resistance > 50 {
            return (false, prevResistance, prevPath)
        } else if c == g.columns {
            return (true, resistance, path)
        }
        
        let up = findFrom(g, resistance, path, g.up(coords))
        let right = findFrom(g, resistance, path, g.right(coords))
        let down = findFrom(g, resistance, path, g.down(coords))
        
        if betterThan(up, right) && betterThan(up, down) {
            return up
        } else if betterThan(right, down) {
            return right
        } else {
            return down
        }
    }
    
    func betterThan(lhs: (Bool, Int, Array<Int>), _ rhs: (Bool, Int, Array<Int>)) -> Bool {
        if lhs.2.count != rhs.2.count {
            return lhs.2.count > rhs.2.count
        } else {
            return lhs.1 <= rhs.1
        }
    }
    
}
