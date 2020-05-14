//
//  Tipsy.swift
//  Tipsy
//
//  Created by Jaime Biernaski on 14/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//
import Foundation

struct Tipsy {
    var tipAmount: Double
    var numberOfPeople: Int
    var billTotal: Double
    
    init(tipAmount: Double,numberOfPeople: Int , billTotal: Double) {
        self.tipAmount = tipAmount
        self.numberOfPeople = numberOfPeople
        self.billTotal = billTotal
    }
    
    mutating func setTipAmount(tipButtonTitle: String) {
        let numberTextOnly = tipButtonTitle.dropLast()
        let value = String(numberTextOnly)
        tipAmount = Double(value)!/100
    }
    
    mutating func setNumberOfPeoble(stepperValue: Double){
        numberOfPeople = Int(stepperValue)
    }
    
    func getNumberOfPeople() -> String {
        return String(numberOfPeople)
    }
    
    func getBill () -> String {
        return String(format: "%.2f", billTotal)
    }
    
    func getTip() -> String {
        return  String(tipAmount * 100)
    }
    
    mutating func calculateBill(billTextField:String) {
        let bill = Double(billTextField.replacingOccurrences(of: ",", with: "."))
        billTotal = (bill! + bill! * tipAmount) / Double(numberOfPeople)
    }

}
