//
//  InputParser.swift
//  PathOfLeastResistance
//
//  Created by Amanda Boder on 4/6/16.
//  Copyright © 2016 Ryan Boder. All rights reserved.
//

import Foundation

class InputParser {
    
    init() {
    }
    
    func parse(input: String) -> Array<Array<Int>> {
        var matrix: Array<Array<Int>> = []
        
        let rowStrings = input.componentsSeparatedByString("\n")
        for rowString in rowStrings {
            if rowString.isEmpty {
                break
            }
            let colStrings = rowString.componentsSeparatedByString(" ")
            matrix.append(colStrings.map() { x in Int(x) ?? 0 })
        }
        
        // Validate that all rows in the grid have the same length
        var width: Int!
        for row in matrix {
            width = width ?? row.count
            if row.count != width {
                fatalError("All rows must have the same length")
            }
        }
        
        return matrix
    }

}