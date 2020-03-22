//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Lee-Hong Lau on 19/3/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        let advice = {() -> (String, UIColor) in
            if (bmiValue < 18.5) {
                return ("Eat more pies!", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
            } else if ((bmiValue >= 18.5) && (bmiValue <= 24.9)) {
                return ("Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
            } else {
                return ("Eat less pies!", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
            }
        }
        
        bmi = BMI(value: bmiValue, advice: advice().0, color: advice().1)
    }
    
    func getBMIValue() -> String {
        let bmiToOneDecimalPlace = String(format: "%.1f", self.bmi?.value ?? 0.0)
        return bmiToOneDecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Eat less pies!"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.red
    }
}
