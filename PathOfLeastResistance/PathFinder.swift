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
        if c == g.columns {
            return (true, resistance, path)
        }
        
        let up = findFrom(g, resistance, path, g.up(coords))
        let right = findFrom(g, resistance, path, g.right(coords))
        let down = findFrom(g, resistance, path, g.down(coords))
        
        if up.1 <= right.1 && up.1 <= down.1 {
            return up
        } else if right.1 <= down.1 {
            return right
        } else {
            return down
        }
    }
    
    
    
}
