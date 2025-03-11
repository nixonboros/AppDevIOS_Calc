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
let no1 = args[0]; // Sample Code Only! Update Required!
let operatorSymbol = args[1]; // Sample Code Only! Update Required!
let no2 = args[2]; // Sample Code Only! Update Required!

// Initialize a Calculator object
let calculator = Calculator();

// Parse the first number, operator, and second number
if let num1 = Int(no1), let num2 = Int(no2) {
    var result = 0
    
    // Perform calc based on the operator
    switch operatorSymbol {
    case "+":
        result = calculator.add(no1: num1, no2: num2)
    case "-":
        result = calculator.subtract(no1: num1, no2: num2)
    default:
        print("Error: Unsupported operator")
        exit(1)
    }
    
    // Output result
    print(no1 + " " + operatorSymbol + " " + no2) // testing
    print(result)
}
