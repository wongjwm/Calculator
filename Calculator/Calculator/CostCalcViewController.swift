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
        if let cost = totalText.text {
            if !cost.isEmpty {
                let costNum = Double(cost)!
                
            }
        }
        
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
