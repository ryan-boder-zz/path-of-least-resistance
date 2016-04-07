import Foundation

// Read an input grid from stdin
var input = ""
while true {
    let line = readLine(stripNewline: true)
    if line == nil || line!.isEmpty {
        break
    }
    input += line! + "\n"
}

// Parse it
let parser = InputParser()
let grid = parser.parse(input)

// Run PathFinder
let finder = PathFinder()
let (success, resistance, path) = finder.find(grid)

// Display the output
print(success ? "Yes" : "No")
print(resistance)
print(path.map(){x in String(x)}.joinWithSeparator(" "))
