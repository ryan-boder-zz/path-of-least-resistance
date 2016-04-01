import Foundation

var input: Array<Array<Int>> = []

while true {
    let rowString = readLine(stripNewline: true)
    if rowString == nil || rowString!.isEmpty {
        break
    }
    let colStrings = rowString!.componentsSeparatedByString(" ")
    input.append(colStrings.map() { x in Int(x) ?? 0 })
}

var width: Int!
for row in input {
    width = width ?? row.count
    if row.count != width {
        fatalError("All rows must have the same length")
    }
}

let finder = PathFinder()
let (success, resistance, path) = finder.find(input)

print(success ? "Yes" : "No")
print(resistance)
print(path.map(){x in String(x)}.joinWithSeparator(" "))
