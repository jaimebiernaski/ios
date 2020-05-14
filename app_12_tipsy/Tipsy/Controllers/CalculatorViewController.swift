//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipsy = Tipsy(tipAmount: 0.1, numberOfPeople: 2, billTotal: 0.0)
    
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        

        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tipsy.setTipAmount(tipButtonTitle: sender.currentTitle!)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        sender.minimumValue = 2
        sender.maximumValue = 99
        sender.stepValue = 1
        tipsy.setNumberOfPeoble(stepperValue: sender.value)
        splitNumberLabel.text = tipsy.getNumberOfPeople()
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        if billTextField.text != "" {
            tipsy.calculateBill(billTextField: billTextField.text!)
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billTotal = tipsy.getBill()
            destinationVC.tipAmount = tipsy.getTip()
            destinationVC.numberOfPeople = tipsy.getNumberOfPeople()
            
        }
        
    }
    
}

