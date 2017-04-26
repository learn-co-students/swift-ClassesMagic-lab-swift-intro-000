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
    
    init( ){
        self.cards = []
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] {
                let card = Card(suit: suit, rank: rank)
                self.cards.append(card)
            }
        }
    }
    
    func shuffle( ){
        self.cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if self.cards.count > 0{
            return self.cards.popLast()
        }
        return nil
    }
    
}
