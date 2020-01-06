//
//  ViewController.swift
//  concentration
//
//  Created by Hosam Elnabawy on 1/6/20.
//  Copyright © 2020 Hosam Elnabawy. All rights reserved.
//

import UIKit

class ConcentrationVC: UIViewController {
    // Outlets
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsLabel: UILabel!
    
    let emojisChoices = [""]
    
    var flipCount = 0 { didSet { flipsLabel.text = "Flips: \(flipCount)"}}
    var game: Concentration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        game = Concentration(numberOfCards: cardButtons.count / 2)
    }


    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardIndex = cardButtons.firstIndex(of: sender) {
            game.chooseCard(by: cardIndex)
            
            updateView()
        }
        
        
    }
    
    
    func updateView() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card   = game.cards[index]
            if card.isFliped {
                button.setTitle(self.getEmoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched == true ?   #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 0) :#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
    }
    
    
    var emojies = ["👿", "👺", "👽", "🤡", "💩", "👻", "👾", "🤠"]
    var emojiDict = [Int: String]()
    
    func getEmoji(for card: Card) -> String {
        let choosedEmoji = emojiDict[card.identifier]
        if choosedEmoji == nil, self.emojies.count > 0 {
            let randInt = Int(arc4random_uniform(UInt32(emojies.count)))
            print("Rand Integer: \(randInt)")
            
            emojiDict[card.identifier] = self.emojies.remove(at: randInt)
            
            print(emojiDict)
        }
        
        return emojiDict[card.identifier] ?? "[\(card.identifier)]"
    }
}

