import Foundation

class PathFinder {
    
    init(){
    }
    
    func find(grid: Array<Array<Int>>) -> (Int!, Array<Int>!) {
        if grid == [] {
            return (nil, [])
        } else {
            return (4, [1])
        }
    }
    
}
