//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Ensure there are enough arguements
if args.count < 3 {
    print("Error: Not enough arguements")
}

// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operatorSymbol = args[1]; // Sample Code Only! Update Required!
//let no2 = args[2]; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();

// Perform calculations (starts with first num)
if let initialNum = Int(args[0]) {
    var result = initialNum
    
    // Calculations with remaining args (operators and nums)
    var currentIndex = 1
    while currentIndex < args.count {
        let operatorSymbol = args[currentIndex]
        currentIndex = currentIndex + 1
        
        if currentIndex < args.count, let nextNumber = Int(args[currentIndex]) {
            // Performs calculation based on operator
            switch operatorSymbol {
            case "+":
                result = calculator.add(no1: result, no2: nextNumber)
            case "-":
                result = calculator.subtract(no1: result, no2: nextNumber)
            default:
                print("Error: Invalid operator")
                exit(1)
            }
        }
        else {
            print("Error: Invalid number after operator")
            exit(1)
        }
        
        currentIndex = currentIndex + 1
    }
    
    // Output result
    print(result)
    print("TEST") // remove
}
else {
    print("Error: Invalid input")
}
