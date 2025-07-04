//
//  ViewController.swift
//  Calculator
//
//  Created by Andre Vasques on 03/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            if newValue.truncatingRemainder(dividingBy: 1) == 0 {
                displayLabel.text = String(Int(newValue))
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var calculator = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: RoundButton) {
        
        if let numValue = sender.currentTitle {
            
            if numValue == "⌫" {
                if !isFinishedTypingNumber, let currentText = displayLabel.text, !currentText.isEmpty {
                    displayLabel.text = String(currentText.dropLast())
                    if displayLabel.text?.isEmpty ?? true {
                        displayLabel.text = "0"
                        isFinishedTypingNumber = true
                    }
                }
                return
            }
            
            if isFinishedTypingNumber {
                
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }
    
}
