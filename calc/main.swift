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

// Ensure there is at least 1 arg
if args.count < 1 {
    print("Error: No arguements given")
    exit(1)
}

// If only one arg is given, check if is a valid int
if args.count == 1 {
    if let singleArg = Int(args[0]) {
        print(singleArg)
        exit(0)
    }
    else {
        print("Error: Invalid number")
        exit(1)
    }
}

// Initialize a Calculator object
let calculator = Calculator();

// First pass: handle multiplication. division, modulus
var argsArray = [String]()
var result = 0

// Check if first arg is a valid int (if valid first arg is assigned to 'result')
if let firstNum = Int(args[0]) {
    result = firstNum
} else {
    print("Error: Invalid first number")
    exit(1)
}


var index = 1
while index < args.count {
    let operatorSymbol = args[index]
    
    // Check if operator is valid
    if !["+", "-", "x", "/", "%"].contains(operatorSymbol) {
        print("Error: Invalid operator '\(operatorSymbol)' in first pass")
        exit(1)
    }
    
    // Ensure the next arg is a valid int num
    if index + 1 >= args.count || Int(args[index + 1]) == nil {
        print("Error: Invalid number after operator '\(operatorSymbol)' in first pass")
        exit(1)
    }

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
    
    // Check if operator is valid
    if !["+", "-"].contains(operatorSymbol) {
        print("Error: Invalid operator '\(operatorSymbol)' in second pass")
        exit(1)
    }
    
    // Ensure the next arg is a valid int num
    if index + 1 >= args.count || Int(args[index + 1]) == nil {
        print("Error: Invalid number after operator '\(operatorSymbol)' in second pass")
        exit(1)
    }

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
