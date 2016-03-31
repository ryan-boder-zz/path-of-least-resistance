import Foundation

class PathFinder {
    
    init(){
    }
    
    func find(grid: Array<Array<Int>>) -> (Int!, Array<Int>!) {
        if grid == [] {
            return (nil, [])
        } else {
            return (grid[0].reduce(0, combine: +), grid[0].map() { _ in 1 })
        }
    }
    
}
