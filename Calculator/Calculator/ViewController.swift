//
//  ViewController.swift
//  Calculator-Project
//
//  Created by Judy on 1/30/18.
//  Copyright © 2018 Judy Wong. All rights reserved.
//

// TO DO
// add commas to numbers
// FIX: dropLast() not working like it should?
// applying percentage to last number in string


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var historyLabel: UILabel!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var displayLabel: UILabel!
    var expressionEval = 0.0;
    var history = [String]()
    
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
        if (displayLabel.text?.last == "/" || displayLabel.text?.last == "*" || displayLabel.text?.last == "-" || displayLabel.text?.last == "+") {
            //displayLabel.text = (displayLabel.text?)! + String(displayLabel.text?.dropLast())
            //print(displayLabel.text?.dropLast())
        }
        
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
            self.evaluateExpression()
        }
        
//        // if string goes over a certain length, must decrease font size
//        if displayLabel.text?.count == 6 {
//            displayLabel.font = UIFont(name: "Arial Bold", size: 34)
//        }
        
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
        
        
        //displayLabel.text
        
        //historyLabel.text = "(" + displayLabel.text! + ")%"
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
            
            //displayLabel.text = String(describing: formatNumWithComma(num: result))  <-- FIX: formatting result w/commas
            displayLabel.text = String(result)
            historyLabel.text = displayLabel.text
            expressionEval = result
        } else {
            print("failed")
        }
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
    
    // Formats a given number with commas
    func formatNumWithComma(num: Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:num))
    }
    
    // Handles swipe action: switch to different color schemes
    @IBAction func swipeHandler(_ gestureRecognizer : UISwipeGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            // Perform actionz
            
            
            twoButton.backgroundColor = UIColor.red
            
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

