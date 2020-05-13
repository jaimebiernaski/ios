//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jaime Biernaski on 13/05/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    
    mutating func calculateBmi(height: Float, weight: Float) {
        let bmiValue = weight/pow(height, 2)
        let color: UIColor?
        let advise: String?
        
        switch bmiValue {
        case 0..<18.5:
            color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            advise = "Underweight"
        case 18.5...24.9:
            color = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            advise = "Normal weight"
        case 25.0...29.9:
            color = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            advise = "Overweight"
        case 30.0...34.9:
            color = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            advise = "Class I obesity"
        case 35.0...39.9:
            color = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            advise = "Class II obesity"
        default:
            color = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            advise = "Class III obesity"
        }
        
        bmi = BMI(value: bmiValue, advice: advise!, color: color!)
    }
    
    func getBmiValue () -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Try again"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.black
    }
    
}
