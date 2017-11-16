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
    
    @IBAction func performOperation(_ sender: UIButton) {
        self.userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
}

