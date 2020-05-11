//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerTitle: UILabel!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]

    var secondsRemaining = 60
    var totalTime = 0
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String = sender.currentTitle!
        
        progressBar.progress = 1.0
        timerTitle.text = hardness
        timer.invalidate()
        
        secondsRemaining = eggTimes[hardness]!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        
        if secondsRemaining > 1 {
            secondsRemaining -= 1
            progressBar.progress = Float(secondsRemaining)/Float(totalTime)
            
        } else {
            progressBar.progress = 0
            timer.invalidate()
            timerTitle.text = "Done!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
