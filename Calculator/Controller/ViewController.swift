//
//  ViewController.swift
//  Calculator
//
//  Created by Andre Vasques on 03/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to a Double.")
        }
        
        if let calcMethod = sender.currentTitle {
            
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "%":
                displayLabel.text = String(number * 0.01)
            case "AC":
                displayLabel.text = "0"
            default:
                fatalError("Unsupported calculation method: \(calcMethod)")
            }
        }
        
    }
    
    @IBAction func numButtonPressed(_ sender: RoundButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    
                    guard let currenDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double")
                    }
                    
                    let isInt = floor(currenDisplayValue) == currenDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

