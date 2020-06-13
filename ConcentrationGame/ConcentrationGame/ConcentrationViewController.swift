//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Puneet Mahali on 13.06.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: ((cardButtons.count + 1) / 2))
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiChoices = ["🎃", "👻", "🍎", "🦇", "🍭", "🍬", "😱", "😈", "👹", "🙀"]
    var emoji = Dictionary<Int, String>()
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1;
        let cardNumber = cardButtons.firstIndex(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if (card.isFaceUp) {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.uid] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.uid] = emojiChoices.remove(at: randomIndex)
        }
        
        return emoji[card.uid] ?? "?"
    }
}
