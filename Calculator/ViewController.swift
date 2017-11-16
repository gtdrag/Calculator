//
//  ViewController.swift
//  Calculator
//
//  Created by George Drag on 11/16/17.
//  Copyright © 2017 SuperHeadAppz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if self.userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            self.display.text = textCurrentlyInDisplay + digit
        } else {
            self.display.text = digit
            self.userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
           return  Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if self.userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            self.userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
    
}

