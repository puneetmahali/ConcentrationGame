//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Puneet Mahali on 13.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        //let cardNumber =
        flipCard(eithEmoji: "🐣", on: sender)
    }
    
    func flipCard(eithEmoji emoji:String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

