import Foundation

class PathFinder {
    
    init(){
    }
    
    func find(grid: Array<Array<Int>>) -> (Int!, Array<Int>!) {
        if grid == [] {
            return (nil, [])
        } else {
            return (grid[0][0], [1])
        }
    }
    
}
