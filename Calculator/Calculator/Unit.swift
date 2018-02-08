//
//  Unit.swift
//  Calculator
//
//  Created by Judy on 2/8/18.
//  Copyright © 2018 ChesongLee. All rights reserved.
//

import Foundation

enum Unit: Int {
    case inch = 0, centimeter, foot, meter, mile
    
    func description() -> String {
        switch self {
        case .inch:
            return "inch"
        case .foot:
            return "foot"
        case .meter:
            return "meter"
        case .mile:
            return "mile"
        case .centimeter:
            return "centimeter"
        }
    }
    
    func convertTo(unit to: Unit, value val: Double) -> Double {
        var constant = 10.0
        switch self {
        case .inch:
            if to == .centimeter {
                constant = 2.54
            } else if to == .foot {
                constant = 0.08333333
            } else if to == .meter {
                constant = 0.0254
            } else if to == .mile {
                constant = 1.5783e-5
            }

        case .centimeter:
            if to == .inch {
                constant = 0.0393701
            } else if to == .foot {
                constant = 0.0328084
            } else if to == .meter {
                constant = 0.01
            } else if to == .mile {
                constant = 6.2137e-6
            }
            
        case .foot:
            if to == .inch {
                constant = 12;
            } else if to == .centimeter {
                constant = 30.48
            } else if to == .meter {
                constant = 0.3048
            } else if to == .mile {
                constant = 0.000189394
            }
            
        case .meter:
            if to == .inch {
                constant = 39.3701
            } else if to == .centimeter {
                constant = 100
            } else if to == .foot {
                constant = 3.28084
            } else if to == .mile {
                constant = 0.000621371
            }
            
        case .mile:
            if to == .inch {
                constant = 63360
            } else if to == .centimeter {
                constant = 160934
            } else if to == .foot {
                constant = 5280
            } else if to == .meter {
                constant = 1609.34
            }
        }
        
        return constant * val
    }
    
    
    static func fromString(_ string: String) -> Unit? {
        if string == "inch" {
            return .inch
        } else if string == "centimeter" {
            return .centimeter
        } else if string == "foot" {
            return .foot
        } else if string == "meter" {
            return .meter
        } else if string == "mile" {
            return .mile
        } else {
            return nil
        }
    }
    
    static func allCases() -> [String] {
        var i = 0
        var list = [String]()
        while let unit = Unit(rawValue: i) {
            list.append(unit.description())
            i = i + 1
        }
        return list
    }
}
