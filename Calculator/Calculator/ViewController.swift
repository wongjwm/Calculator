//
//  ViewController.swift
//  Calculator-Project
//
//  Created by Judy on 1/30/18.
//  Copyright © 2018 Judy Wong. All rights reserved.
//

// TO DO
// fix text color: change to something more subtle
// FIX: dropLast() not working like it should?
// applying percentage to last number in string


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var historyLabel: UILabel!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var displayLabel: UILabel!
    var expressionEval = 0.0;
    
    // used to apply percentage on last number in string
    var lastNumPressed = 0.0
    
    @IBOutlet var tipButton: UIButton!
    @IBOutlet var convertButton: UIButton!
    @IBOutlet var currencyButton: UIButton!
    
    @IBOutlet var posNegButton: UIButton!
    @IBOutlet var percentButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var subtractButton: UIButton!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var equalButton: UIButton!
    @IBOutlet var decimalButton: UIButton!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    @IBOutlet var sevenButton: UIButton!
    @IBOutlet var eightButton: UIButton!
    @IBOutlet var nineButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shadowStyle(button: clearButton)
        self.shadowStyle(button: posNegButton)
        self.shadowStyle(button: percentButton)
        self.shadowStyle(button: divideButton)
        self.shadowStyle(button: percentButton)
        self.shadowStyle(button: multiplyButton)
        self.shadowStyle(button: percentButton)
        self.shadowStyle(button: subtractButton)
        self.shadowStyle(button: addButton)
        self.shadowStyle(button: equalButton)
        self.shadowStyle(button: decimalButton)
        self.shadowStyle(button: zeroButton)
        self.shadowStyle(button: oneButton)
        self.shadowStyle(button: twoButton)
        self.shadowStyle(button: threeButton)
        self.shadowStyle(button: fourButton)
        self.shadowStyle(button: fiveButton)
        self.shadowStyle(button: sixButton)
        self.shadowStyle(button: sevenButton)
        self.shadowStyle(button: eightButton)
        self.shadowStyle(button: nineButton)
        
        displayLabel.text = "0"
        historyLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numberPressed(_ sender: Any) {
        clearButton.setTitle("c", for: .normal)
        if displayLabel.text == "0" {
            displayLabel.text = ""
        }
        
        //  convert ints to doubles so answer is accurate
        
        displayLabel.text = displayLabel.text! + String((sender as AnyObject).tag - 1)
        displayLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func actionPressed(_ sender: Any) {
    
        // if new line, use previous result
        if displayLabel.text?.count == 0 {
            displayLabel.text = historyLabel.text!
        }
        
        // if two symbols are entered in a row, replace last symbol
//        if (displayLabel.text?.last == "/" || displayLabel.text?.last == "*" || displayLabel.text?.last == "-" || displayLabel.text?.last == "+") {
//            let temp  = displayLabel.text?.dropLast()
//            displayLabel.text = String(describing: temp)
//            print(temp!)
//        }
        
        // if last char is a ".", insert ".0 after it
        else if displayLabel.text?.last == "." {
            displayLabel.text = displayLabel.text! + "0"
        }
        self.displayOp(tag: (sender as AnyObject).tag)
        displayLabel.adjustsFontSizeToFitWidth = true
    }
    
    // Displays the correct operator
    func displayOp(tag: Int) {
        switch tag  {
        case 12:
            displayLabel.text = displayLabel.text! + String("/")
        case 13:
            displayLabel.text = displayLabel.text! + String("*")
        case 14:
            displayLabel.text = displayLabel.text! + String("-")
        case 15:
            displayLabel.text = displayLabel.text! + String("+")
        default:
            displayLabel.text = displayLabel.text!
        }
    }
    
    
    // Actions for when "=" button is pressed
    @IBAction func enterPressed(_ sender: Any) {
        if !(displayLabel.text?.last == "." || displayLabel.text?.last == "/" || displayLabel.text?.last == "*" ||
            displayLabel.text?.last == "-" || displayLabel.text?.last == "+") {
            historyLabel.isHidden = false
            
            // removes commas for calculation
            displayLabel.text = displayLabel.text?.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range: nil)
            
            //insert .0 for calculation? but what if it already has decimal?
            
            
            self.evaluateExpression()
        }
        
        // format answer so whole result is shown (decimals) (ex. if numbers ends with .0, remove .0)
//        if displayLabel.text?.suffix(2) == ".0" {
//            displayLabel.text = displayLabel.text!.dropLast(2)
//        }
        
        displayLabel.adjustsFontSizeToFitWidth = true
        historyLabel.adjustsFontSizeToFitWidth = true
    }
    
    // Actions for when "ac/c" button is pressed
    @IBAction func clear(_ sender: Any) {
        displayLabel.text = ""
        historyLabel.text = ""
        clearButton.setTitle("ac", for: .normal)
    }
    
    // Actions for when "." button is pressed
    @IBAction func decimalPressed(_ sender: Any) {
        if !(displayLabel.text?.last == ".") {
            displayLabel.text = displayLabel.text! + "."
        }
    }
    
    // Actions for when "%" button is pressed (applied to last inputted number)
    @IBAction func percentPressed(_ sender: Any) {
        self.evaluateExpression()
        
        //get last number, apply % to that number
        let percentApplied = lastNumPressed * 0.01
        
        displayLabel.text = String(expressionEval * 0.01)
    }
    
    // Actions for when "+/-" button is pressed
    @IBAction func flipSignPressed(_ sender: Any) {
        self.evaluateExpression()
        displayLabel.text = String(expressionEval * -1)
    }
    
    // evaluates the expression
    func evaluateExpression() {
        let expression = NSExpression(format: displayLabel.text!)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            self.formatNumWithComma(num: result)
            historyLabel.text = displayLabel.text
            //expressionEval = result
        } else {
            print("failed")
        }
    }
    
    // Formats a given number with commas
    func formatNumWithComma(num: Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:num))
        displayLabel.text! = formattedNumber!
    }
    
    
    

    @IBAction func tipPressed(_ sender: Any) {
        // pull up new menu for tip convertion
    }
    
    @IBAction func convertPressed(_ sender: Any) {
        // pull up new menu for unit convertion
    }
    
    @IBAction func currencyPressed(_ sender: Any) {
        // pull up new menu for currency convertion
    }
    
    
    // calculate total (tip or sales tax) based on % given and number of persons (optional)
    func calculateTip(percentage: Double,  numPersons: Int) {
        let persons = Double(numPersons)
        let result = ((self.expressionEval * percentage) + self.expressionEval) / persons
    }
    
    //calculate conversion
    func calculateConversion(multiplier: Double) {
        let result = self.expressionEval * multiplier
    }
    
    // Handles swipe action: switch to different color schemes
    @IBAction func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
        
        // have an array of color schemes?
        // new class: colorScheme-- has backgroundcolor, numButtonColor, opButtonColor,
        
        if gestureRecognizer.state == .ended {
            
            
            // Perform actionz
            
            // Color Scheme 1
//            self.view.backgroundColor = UIColor(red:1.00, green:0.87, blue:0.86, alpha:1.0)
//            let numColor = UIColor(red:0.83, green:0.75, blue:0.84, alpha:1.0)
//            let opColor = UIColor(red:0.11, green:0.16, blue:0.44, alpha:1.0)
//            let otherColor = UIColor(red:0.57, green:0.13, blue:0.36, alpha:1.0)
        
            // Color Scheme 2
            self.view.backgroundColor = UIColor(red:0.05, green:0.09, blue:0.07, alpha:1.0)
            let numColor = UIColor(red:0.87, green:0.67, blue:0.56, alpha:1.0)
            let opColor = UIColor(red:0.04, green:0.39, blue:0.37, alpha:1.0)
            let otherColor = UIColor(red:0.76, green:0.88, blue:0.86, alpha:1.0)
            
            zeroButton.backgroundColor = numColor
            oneButton.backgroundColor = numColor
            twoButton.backgroundColor = numColor
            threeButton.backgroundColor = numColor
            fourButton.backgroundColor = numColor
            fiveButton.backgroundColor = numColor
            sixButton.backgroundColor = numColor
            sevenButton.backgroundColor = numColor
            eightButton.backgroundColor = numColor
            nineButton.backgroundColor = numColor
            
            decimalButton.backgroundColor = numColor
            
            clearButton.backgroundColor = otherColor
            posNegButton.backgroundColor = otherColor
            percentButton.backgroundColor = otherColor
            divideButton.backgroundColor = opColor
            multiplyButton.backgroundColor = opColor
            subtractButton.backgroundColor = opColor
            addButton.backgroundColor = opColor
            equalButton.backgroundColor = UIColor.black
            
            
        }
    }
    
    // shadow styling for buttons
    func shadowStyle(button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 2.0;
        button.layer.shadowOpacity = 0.2;
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.showsTouchWhenHighlighted = true
    }
    

}

