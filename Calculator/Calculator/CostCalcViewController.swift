//
//  CostCalcViewController.swift
//  Calculator
//
//  Created by Judy on 2/8/18.
//  Copyright © 2018 ChesongLee. All rights reserved.
//

import UIKit

class CostCalcViewController: UIViewController {

    @IBOutlet var totalText: UITextField!
    @IBOutlet var percentText: UITextField!
    @IBOutlet var numPersonText: UITextField!
    @IBOutlet var finalTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numPersonText.placeholder = "1"
        percentText.placeholder = "15"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func calculateCost(_ sender: Any) {
        var costNum = 0.0
        var percentNum = 0.0
        var numPersonNum = 1
        
        if let cost = totalText.text {
            if !cost.isEmpty {
                costNum = Double(cost)!
            }
        }
        
        if let percent = percentText.text {
            if !percent.isEmpty {
                percentNum = Double(percent)! * 0.01
            }
        }
        
        if let numPerson = numPersonText.text {
            if !numPerson.isEmpty {
                numPersonNum = Int(numPerson)!
            }
            // add edge case-- can only have integers
        }
        // format answer to 2 decimal places
        finalTotal.text = String(format: "%.02f", (costNum + (costNum * percentNum)) / Double(numPersonNum))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
