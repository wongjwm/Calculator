//
//  ViewController.swift
//  Calculator-Project
//
//  Created by Judy on 1/30/18.
//  Copyright © 2018 Judy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // use table instead of labels???
    @IBOutlet var historyLabel: UILabel!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var displayLabel: UILabel!
    var expressionEval = 0.0;
    var isReset = true
    var history = [String]()
    
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
        displayLabel.text = ""
        historyLabel.isHidden = true
        
        let tipImg = UIImage(named: "tip")
        let rulerImg = UIImage(named: "ruler")
        let currencyImg = UIImage(named: "currency")
        tipButton.setImage(tipImg, for: .normal)
        convertButton.setImage(rulerImg, for: .normal)
        currencyButton.setImage(currencyImg, for: .normal)
        
        
        
        
//        self.shadowStyle(button: posNegButton)
//        self.shadowStyle(button: percentButton)
//        self.shadowStyle(button: divideButton)
//        self.shadowStyle(button: multiplyButton)
//        self.shadowStyle(button: subtractButton)
//        self.shadowStyle(button: addButton)
//        self.shadowStyle(button: equalButton)
//        self.shadowStyle(button: decimalButton)
//        self.shadowStyle(button: zeroButton)
//        self.shadowStyle(button: oneButton)
//        self.shadowStyle(button: twoButton)
//        self.shadowStyle(button: threeButton)
//        self.shadowStyle(button: fourButton)
//        self.shadowStyle(button: fiveButton)
//        self.shadowStyle(button: sixButton)
//        self.shadowStyle(button: sevenButton)
//        self.shadowStyle(button: eightButton)
//        self.shadowStyle(button: nineButton)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numberPressed(_ sender: Any) {
        clearButton.setTitle("c", for: .normal)
        
        // THINGS TO FIX
        //  reset after enter has been pressed
//        if isReset {
//            displayLabel.text = ""
//        }
        
        //  convert ints to doubles so answer is accurate
        
        displayLabel.text = displayLabel.text! + String((sender as AnyObject).tag - 1)
    }
    
    @IBAction func actionPressed(_ sender: Any) {
        // switch statement for all cases
        
        // throw an error when two symbols are entered in a row

        // if new line, use previous result
        if displayLabel.text?.count == 0 {
            displayLabel.text = historyLabel.text!
        }
        
        if !(displayLabel.text?.last == ".") {
            displayLabel.text = displayLabel.text! + "0"
        }
        
        
        
        if (sender as AnyObject).tag == 12 {
            displayLabel.text = displayLabel.text! + String("/")
        }
        else if (sender as AnyObject).tag == 13  {
            displayLabel.text = displayLabel.text! + String("*")
        }
        else if (sender as AnyObject).tag == 14  {
            displayLabel.text = displayLabel.text! + String("-")
        }
        else if (sender as AnyObject).tag == 15 {
            displayLabel.text = displayLabel.text! + String("+")
        }
    }
    
    // Actions for when "=" button is pressed
    @IBAction func enterPressed(_ sender: Any) {
        if !(displayLabel.text?.last == ".") {
            historyLabel.isHidden = false
            self.evaluateExpression()
            isReset = true
        }
        
        // if string ends with an op, cannot compute
        
        // if string goes over a certain length, must decrease font size
    }
    
    // Actions for when "ac/c" button is pressed
    @IBAction func clear(_ sender: Any) {
        displayLabel.text = ""
        clearButton.setTitle("ac", for: .normal)
    }
    
    // Actions for when "." button is pressed
    @IBAction func decimalPressed(_ sender: Any) {
        if !(displayLabel.text?.last == ".") {
            displayLabel.text = displayLabel.text! + "."
        }
    }
    
    // Actions for when "%" button is pressed
    @IBAction func percentPressed(_ sender: Any) {
        self.evaluateExpression()
        historyLabel.text = "(" + displayLabel.text! + ")%"
        displayLabel.text = String(expressionEval * 0.01)
    }
    
    // Actions for when "+/-" button is pressed
    @IBAction func flipSignPressed(_ sender: Any) {
        self.evaluateExpression()
        historyLabel.text = "-(" + displayLabel.text! + ")"
        displayLabel.text = String(expressionEval * -1)
    }
    
    // evaluates the expression
    func evaluateExpression() {
        let expression = NSExpression(format: displayLabel.text!)
        historyLabel.text = displayLabel.text
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            displayLabel.text = String(result)
            expressionEval = result
        } else {
            print("failed")
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
    
    @IBAction func tipPressed(_ sender: Any) {
    }
    
    @IBAction func convertPressed(_ sender: Any) {
    }
    
    
    @IBAction func currencyPressed(_ sender: Any) {
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
    
    

}

