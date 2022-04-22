//
//  CookingViewController.swift
//  Steak o'clock
//
//  Created by Szymon Wnuk on 10/04/2022.
//

import UIKit
import AVFoundation

class CookingViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var flipLabel: UILabel!
    
    // Creating constants and variables
    
    
    let steakTimes = ["Rare": 90, "Medium" : 180, "Well-done": 240]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    var flip = false
    
    
    @IBAction func stateSelection(_ sender: UIButton) {
        timer.invalidate()
        let states = sender.currentTitle!
        totalTime = steakTimes[states]!
        progressBar.progress = 0.0
        secondsPassed = 0
        flipLabel.text = states
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    // Updating timer, changing labels and adding sounds effect
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
            if flip == false {
                flipLabel.text = "Your steak is halfway done. Flip it, and start timer"
        // Billy Mays sound
                let url = Bundle.main.url(forResource: "billy-mays-but-im-not-done-yet", withExtension: "mp3")
                
                
                
                player = try! AVAudioPlayer(contentsOf: url!)
                            player.play()
                            flip = true}
                            else {flipLabel.text = "Ready to serve!!!"
        // Anakin Skywalker sound
                                let url = Bundle.main.url(forResource: "Anakin What have i done Sound Effect", withExtension: "mp3")
                                player = try! AVAudioPlayer(contentsOf: url!)
                                player.play()
            }
        }
    } }



