//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jaime Biernaski on 14/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var numberOfPeople: String? 
    var billTotal: String?
    var tipAmount: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var stringsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billTotal
        stringsLabel.text = "Split between \(numberOfPeople!) people, with \(tipAmount!)% tip."
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}
