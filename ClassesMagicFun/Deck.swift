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
    var nextCard: Int
    
    init() {
        cards = []
        nextCard = 0
        var r: Int = 1
        
        while r <= 13 {
            if r == 1 {
                generateCard("A")
            } else if r == 11 {
                generateCard("J")
            } else if r == 12 {
                generateCard("Q")
            } else if r == 13 {
                generateCard("K")
            } else {
                generateCard(String(r))
            }
            
            r += 1
        }
    }
    
    func generateCard(_ cardrank: String) {
        self.cards.append(Card.init(suit: "♠️", rank: cardrank))
        self.cards.append(Card.init(suit: "♥️", rank: cardrank))
        self.cards.append(Card.init(suit: "♣️", rank: cardrank))
        self.cards.append(Card.init(suit: "♦️", rank: cardrank))
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        var output: Card? = nil
        
        if cards.count >= nextCard + 1 {
            output = cards[nextCard]
            nextCard += 1
        }
        
        return output
    }
}
