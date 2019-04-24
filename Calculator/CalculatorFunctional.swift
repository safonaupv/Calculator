import Foundation


enum Operation{
    case clear
    case binaryOperation((Double, Double) -> String)
    case equals
}
var accumulator: String!
var firstArg: Double!
var operationArg: ((Double, Double) -> String)!
var secondArg: Double!
var binary: Bool = false
var operationDictionary: Dictionary<String, Operation> = [
    "c": Operation.clear,
    "+": Operation.binaryOperation(summation),
    "-": Operation.binaryOperation(substraction),
    "*": Operation.binaryOperation(multiplication),
    "/": Operation.binaryOperation(division),
    "=": Operation.equals]


func function( name: String, arg: String) -> String {
    guard let operation = operationDictionary[name] else {return "0"}
    switch operation {
    case .clear:
        firstArg = nil
        secondArg = nil
        accumulator = nil
        binary = false
        return "0"
    case .binaryOperation(let value):
        if !binary{
            operationArg = value
            firstArg = Double(arg)
            if accumulator == nil{
                accumulator = String(firstArg)
            }
            binary = true
            return arg
        } else {
            firstArg = Double(accumulator)
            secondArg = Double(arg)
            accumulator = calculate(firstArg, function: operationArg, secondArg)
            operationArg = value
            firstArg = Double(accumulator)
            return accumulator
        }
    case .equals:
        if (firstArg == nil && secondArg == nil){
            return arg
        } else {
            if binary{
                secondArg = Double(arg)
            } else {
                firstArg = Double(arg)
            }
        }
        binary = false
        accumulator = calculate(firstArg, function: operationArg, secondArg)
        return accumulator
    }
}

func summation(arg1: Double, arg2: Double) -> String{
    return String(arg1 + arg2)
}

func substraction(arg1: Double, arg2: Double) -> String{
    return String(arg1 - arg2)
}

func multiplication(arg1: Double, arg2: Double) -> String{
    return String(arg1 * arg2)
}

func division(arg1: Double, arg2: Double) -> String{
    if arg2 == 0{
        firstArg = nil
        secondArg = nil
        accumulator = nil	
        return "Zero Division!!!"
    }
    return String(arg1 / arg2)
}

func calculate(_ arg1: Double, function: (Double, Double) -> String,_ arg2: Double) -> String{
    return function(arg1, arg2)   
}
