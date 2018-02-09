//
//  Currency.swift
//  Calculator
//
//  Created by Judy on 2/8/18.
//  Copyright © 2018 ChesongLee. All rights reserved.
//

import Foundation


enum Currency: Int {
    case USD = 0, EURO, JPY, GBP
    
    func description() -> String {
        switch self {
        case .USD:
            return "USD"
        case .EURO:
            return "EURO"
        case .JPY:
            return "JPY"
        case .GBP:
            return "GBP"
        }
    }
    
    func convertTo(curr to: Currency, value val: Double) -> Double {
        var constant = 10.0
        switch self {
        case .USD:
            if to == .EURO {
                constant = 2.54
            } else if to == .JPY {
                constant = 0.08333333
            } else if to == .GBP {
                constant = 0.0254
            }
            
        case .EURO:
            if to == .USD {
                constant = 0.0393701
            } else if to == .JPY {
                constant = 0.0328084
            } else if to == .GBP {
                constant = 0.01
            }
            
        case .JPY:
            if to == .USD {
                constant = 12;
            } else if to == .EURO {
                constant = 30.48
            } else if to == .JPY {
                constant = 0.3048
            } else if to == .GBP {
                constant = 0.000189394
            }
            
        case .GBP:
            if to == .USD {
                constant = 39.3701
            } else if to == .EURO {
                constant = 100
            } else if to == .JPY {
                constant = 3.28084
            } 
        }
        
        return constant * val
    }
    
    
    func fromString(_ string: String) -> Currency? {
        if string == "USD" {
            return .USD
        } else if string == "EURO" {
            return .EURO
        } else if string == "JPY" {
            return .JPY
        } else if string == "GBP" {
            return .GBP
        } else {
            return nil
        }
    }
    
    func allCases() -> [String] {
        var i = 0
        var list = [String]()
        while let curr = Currency(rawValue: i) {
            list.append(curr.description())
            i = i + 1
        }
        return list
    }
}


