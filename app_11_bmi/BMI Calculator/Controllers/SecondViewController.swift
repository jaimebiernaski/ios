//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Jaime Biernaski on 13/05/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        let label = UILabel()
        label.text = bmiValue
        label.textColor = UIColor.white
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 50)
        view.addSubview(label)
    }
    
}
