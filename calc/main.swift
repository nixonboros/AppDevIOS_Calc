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

// First pass: handle multiplication. division, modulus
var argsArray = [String]()
var result = Int(args[0])!

var index = 1
while index < args.count {
    let operatorSymbol = args[index]
    let nextNumber = Int(args[index + 1])!
    
    switch operatorSymbol {
        case "x":
            result = calculator.multiply(no1: result, no2: nextNumber)
        case "/":
            result = calculator.divide(no1: result, no2: nextNumber)
        case "%":
            result = calculator.modulus(no1: result, no2: nextNumber)
        default:
            argsArray.append((String(result)))
            argsArray.append(operatorSymbol)
            result = nextNumber
    }
    
    index = index + 2
}
argsArray.append(String(result))

// Second pass: handle addition, subtraction
result = Int(argsArray[0])!

index = 1
while index < argsArray.count {
    let operatorSymbol = argsArray[index]
    let nextNumber = Int(argsArray[index + 1])!
    
    switch operatorSymbol {
        case "+":
            result = calculator.add(no1: result, no2: nextNumber)
        case "-":
            result = calculator.subtract(no1: result, no2: nextNumber)
        default:
            print("Error: Invalid operator in second pass")
        exit(1)
    }
    
    index = index + 2
}

// Output result
print(result)
