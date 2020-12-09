//
//  CalcModel.swift
//  CalculatorApp
//
//  Created by Abylbek Khassenov on 9/12/20.
//  Copyright © 2020 Abyl. All rights reserved.
//

import Foundation
enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double , Double) -> Double)
    case equals
    case delete
}
struct CalculatorModel {
    var my_operations: Dictionary<String , Operation> =
        [
            "AC" : Operation.delete,
            "=" : Operation.equals,
            "𝞹" : Operation.constant(Double.pi),
            "e" : Operation.constant(M_E),
            "√" : Operation.unaryOperation(sqrt),
            "ln": Operation.unaryOperation(log),
            "sin" : Operation.unaryOperation(sin),
            "cos" : Operation.unaryOperation(cos),
            "tan" : Operation.unaryOperation(tan),
            "x!" : Operation.unaryOperation(factorial),
            "x^2" : Operation.unaryOperation({pow($0 , 2)}) ,
            "x^3" : Operation.unaryOperation({pow($0 , 3)}),
            "e^x" : Operation.unaryOperation({pow(M_E , $0)}),
            "10^x" : Operation.unaryOperation({pow(10 , $0)}),
            "+" : Operation.binaryOperation({$0 + $1}),
            "-" : Operation.binaryOperation({$0 - $1}),
            "*" : Operation.binaryOperation({$0 * $1}),
            "÷" : Operation.binaryOperation({$0 / $1})
        ]
    private var global_value : Double?
    mutating func setOpernad(_ operand : Double){
        global_value = operand
    }
    mutating func performOperation(_ operation : String){
        let symbol = my_operations[operation]!
        switch  symbol{
        case .constant(let value):
            global_value = value
        case .unaryOperation(let function):
            global_value = function(global_value!)
        case .binaryOperation(let function):
            saving = SaveFirstOperandAndOperation(firstOperand: global_value!, operation: function)
        case .equals:
            if saving != nil && global_value != nil{
                global_value = saving!.performOperationWith(secondOperand: global_value!)
                saving = nil
            }
        case .delete:
            global_value = 0
        }
    }
    var result : Double?{
        get {
            return global_value
            }
    }
    private var saving : SaveFirstOperandAndOperation?
    struct SaveFirstOperandAndOperation {
        var firstOperand : Double
        var operation : (Double, Double)->Double
        func performOperationWith(secondOperand op2: Double)->Double{
                return operation(firstOperand , op2)
        }
    }
}
func factorial(op1 : Double)->Double{
    var fact = 1
    let end = Int(op1)
    if op1 == 0{return 0}
    else{
    for i in 1...end{  fact = fact*Int(i)  }
        return Double(fact)
    }
}

