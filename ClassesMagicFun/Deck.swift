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
        cards.shuffleInPlace()
    }
    func drawCard() -> Card? {
        if !cards.isEmpty {
            let ret: Card = cards.first!
            cards.remove(at: 0)
            return ret
        } else {
            return nil
        }
    }
    init() {
        
        // populate deck
        for i in 1...13 {
            if i == 1 {
                addCard(rank: "A")
            } else if ( (11...13).contains(i) ) {
                if i == 11 {
                    addCard(rank: "J")
                } else if i == 12 {
                    addCard(rank: "Q")
                } else if i == 13 {
                    addCard(rank: "K")
                }
            } else {
                addCard(rank: String(i))
            }
        }
        shuffle()
        
    }
    
    func addCard(rank: String) {
        self.cards.append(Card(suit: "♣️", rank: rank))
        self.cards.append(Card(suit: "♦️", rank: rank))
        self.cards.append(Card(suit: "♠️", rank: rank))
        self.cards.append(Card(suit: "♥️", rank: rank))
    }
}
