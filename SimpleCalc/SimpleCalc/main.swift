//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let simpleOperators = ["+", "-", "*", "/", "%"]
        if args.count == 3 && simpleOperators.contains(args[1]) { //simple operations
            return simpleOp(args)
        } else { // complex operations
            return complexOp(args)
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    private func simpleOp(_ args: [String]) -> Int{
        let optr = args[1]
        switch optr {
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        case "%":
            return Int(args[0])! % Int(args[2])!
        default:
            return nilHandleErr
        }
    }
    
    private func complexOp(_ args: [String]) -> Int{
        if args.count == 1 { // ["count"], ["avg"], ["fact"] is 0 (no arguments)
            return 0
        }
        let optr = args.last
        switch optr {
        case "count"?, "avg"?:
            let nums:[Int] = args[0..<args.count - 1].map({x in Int(x)!}) // array of all numbers
            let sum = nums.reduce(0, +)
            let count = nums.count
            if optr == "count" { // count
                return count
            } else { //avg
                return sum / count
            }
        case "fact"?:
            let num = Int(args[0])
            if let num = num { // assertion
                return getFactorial(num)
            }
            return nilHandleErr
        default:
            return nilHandleErr
        }
    }
    
    // returns factorial of a given number
    private func getFactorial (_ num: Int) -> Int{
        var result = 1
        for i in 1..<num + 1 {
            result = result * i
        }
        return result
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))



