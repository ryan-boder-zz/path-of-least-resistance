import Foundation

class PathFinder {
    
    init() {
    }
    
    func find(grid: Array<Array<Int>>) -> (Int!, Array<Int>!) {
        if grid == [] {
            return (nil, [])
        }
        
        let g = Grid(grid)
        var least: (Int!, Array<Int>!)! = nil
        for row in 1...g.rows {
            let rowLeast = findFrom(g, 0, [], (row, 1))
            if (least == nil || rowLeast.0 < least.0) {
                least = rowLeast
            }
        }
        
        return least
    }
    
    func findFrom(g: Grid, _ previousResistance: Int, _ previousPath: Array<Int>, _ coords: (Int, Int)) -> (Int!, Array<Int>!) {
        let resistance = previousResistance + g.get(coords)
        let (r, c) = coords
        let path = previousPath + [r]
        if c == g.columns {
            return (resistance, path)
        }
        
        let up = findFrom(g, resistance, path, g.up(coords))
        let right = findFrom(g, resistance, path, g.right(coords))
        let down = findFrom(g, resistance, path, g.down(coords))
        
        if up.0 <= right.0 && up.0 <= down.0 {
            return up
        } else if right.0 <= down.0 {
            return right
        } else {
            return down
        }
    }
    
    
    
}
