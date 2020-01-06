//
//  Concentration.swift
//  concentration
//
//  Created by Hosam Elnabawy on 1/6/20.
//  Copyright © 2020 Hosam Elnabawy. All rights reserved.
//

import Foundation


class Concentration {
    
    var cards = [Card]()
    
    var indexOfFlipedCard: Int?
    
    func chooseCard(by index: Int) {
        if !cards[index].isMatched {
            if let matchedIndex = indexOfFlipedCard , matchedIndex != index {
                if cards[matchedIndex].identifier == cards[index].identifier {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFliped = true
                indexOfFlipedCard = nil
            } else {
                for flipIndex in cards.indices {
                    cards[flipIndex].isFliped  = false
                }
                cards[index].isFliped = true
                indexOfFlipedCard = index
                
            }
        }

    }
    
    init(numberOfCards: Int) {
        for num in 0...numberOfCards {
            let card = Card(identifier: num)
            
            self.cards += [card, card]
        }
        self.cards.shuffle()
        print(self.cards)
        self.shuffleCards()
    }
    
    
    func shuffleCards() {
        var newCards = self.cards
        
        for _ in self.cards {
            let item = newCards.remove(at: 0)
            let randInt = Int(arc4random_uniform(UInt32(newCards.count)))
            
            newCards.insert(item, at: randInt)
        }
        
        print("New Cards: \(newCards)")
        
    }
}
