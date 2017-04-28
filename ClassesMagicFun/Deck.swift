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
    func shuffle() {
        self.cards.shuffleInPlace()
    }
    func drawCard() -> Card? {
        if !self.cards.isEmpty {
            return nil
        } else {
            let card = self.cards[0]
            self.cards.remove(at: 0)
            return card
        }
    }
}
