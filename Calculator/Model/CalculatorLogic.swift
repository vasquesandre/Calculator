//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Andre Vasques on 04/07/25.
//

import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "AC":
                return 0
            default:
                fatalError("Unsupported calculation method: \(symbol)")
            }
        }
        return nil
        
    }
    
}
