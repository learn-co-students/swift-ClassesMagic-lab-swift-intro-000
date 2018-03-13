//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    
    var cards: [Card]
    
    init() {
        self.cards = [Card(suit: "❤️", rank: "A")]
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if !cards.isEmpty {
            let dealtCard = cards[0]
            cards.remove(at: 0)
            return dealtCard
        }
        else {
            return nil
        }
    }
    
}
