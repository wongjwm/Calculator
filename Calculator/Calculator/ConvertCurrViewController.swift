//
//  ConvertCurrViewController.swift
//  Calculator
//
//  Created by Judy on 2/8/18.
//  Copyright © 2018 ChesongLee. All rights reserved.
//

import UIKit

class ConvertCurrViewController: UIViewController {
//
//    let list = Currency.allCases()
//    @IBOutlet var currPicker: UIPickerView!
//    @IBOutlet var inputText: UITextField!
//    @IBOutlet var outputText: UITextField!
//    @IBOutlet var convertButton: UIButton!
//
//
    override func viewDidLoad() {
        super.viewDidLoad()
        //currPicker.delegate = self as! UIPickerViewDelegate
        //currPicker.dataSource = self as! UIPickerViewDataSource

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//
//    // Returns num of fields of number picker
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//
//    //
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return list.count
//    }
//
//    //
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return list[row]
//    }
//
//    @IBAction func convertUnits(_ sender: AnyObject) {
//
//        if self.view .isKind(of: ConvertUnitViewController.self) {
//
//        }
//
//        let fromUnitIdx = currPicker.selectedRow(inComponent: 0)
//        let toUnitIdx = currPicker.selectedRow(inComponent: 1)
//        let fromUnit = Currency.fromString(list[fromUnitIdx])!
//        let toUnit = Currency.fromString(list[toUnitIdx])!
//        if let input = inputText.text {
//            if !input.isEmpty {
//                let inputNum = Double(input)!
//                let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
//                outputText.text = String(outputNum)
//            }
//        }
//
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
