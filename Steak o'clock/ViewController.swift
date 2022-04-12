//
//  ViewController.swift
//  Steak o'clock
//
//  Created by Szymon Wnuk on 10/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTitle.text = ""
        var charIndex = 0.0
        let tittleText = "It's steak o'clock!"
        for letter in tittleText {
            print("-")
            print(0.1 * charIndex)
            print(letter)
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false)
            { (timer) in self.appTitle.text?.append(letter)
            }
            charIndex += 1
        }
      
    }


}

