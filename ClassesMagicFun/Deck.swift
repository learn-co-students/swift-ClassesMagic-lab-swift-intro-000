//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card] = []
    var nextCard : Int = 0
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if (self.cards.count != 0) {
            self.nextCard += 1
            return cards[cards.count - self.nextCard]
        }
        return nil
    }
}
