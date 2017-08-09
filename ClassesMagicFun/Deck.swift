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
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if cards.isEmpty {return nil}
        else {return cards[0]}
    }
    
    init() {
        self.cards = [  Card.init(suit: "♠️", rank: "A"),
                        Card.init(suit: "♠️", rank: "2"),
                        Card.init(suit: "♠️", rank: "3"),
                        Card.init(suit: "♠️", rank: "4"),
                        Card.init(suit: "♠️", rank: "5"),
                        Card.init(suit: "♠️", rank: "6"),
                        Card.init(suit: "♠️", rank: "7"),
                        Card.init(suit: "♠️", rank: "8"),
                        Card.init(suit: "♠️", rank: "9"),
                        Card.init(suit: "♠️", rank: "10"),
                        Card.init(suit: "♠️", rank: "J"),
                        Card.init(suit: "♠️", rank: "Q"),
                        Card.init(suit: "♠️", rank: "K"),
                        Card.init(suit: "♣️", rank: "A"),
                        Card.init(suit: "♣️", rank: "2"),
                        Card.init(suit: "♣️", rank: "3"),
                        Card.init(suit: "♣️", rank: "4"),
                        Card.init(suit: "♣️", rank: "5"),
                        Card.init(suit: "♣️", rank: "6"),
                        Card.init(suit: "♣️", rank: "7"),
                        Card.init(suit: "♣️", rank: "8"),
                        Card.init(suit: "♣️", rank: "9"),
                        Card.init(suit: "♣️", rank: "10"),
                        Card.init(suit: "♣️", rank: "J"),
                        Card.init(suit: "♣️", rank: "Q"),
                        Card.init(suit: "♣️", rank: "K"),
                        Card.init(suit: "♥️", rank: "A"),
                        Card.init(suit: "♥️", rank: "2"),
                        Card.init(suit: "♥️", rank: "3"),
                        Card.init(suit: "♥️", rank: "4"),
                        Card.init(suit: "♥️", rank: "5"),
                        Card.init(suit: "♥️", rank: "6"),
                        Card.init(suit: "♥️", rank: "7"),
                        Card.init(suit: "♥️", rank: "8"),
                        Card.init(suit: "♥️", rank: "9"),
                        Card.init(suit: "♥️", rank: "10"),
                        Card.init(suit: "♥️", rank: "J"),
                        Card.init(suit: "♥️", rank: "Q"),
                        Card.init(suit: "♥️", rank: "K"),
                        Card.init(suit: "♦️", rank: "A"),
                        Card.init(suit: "♦️", rank: "2"),
                        Card.init(suit: "♦️", rank: "3"),
                        Card.init(suit: "♦️", rank: "4"),
                        Card.init(suit: "♦️", rank: "5"),
                        Card.init(suit: "♦️", rank: "6"),
                        Card.init(suit: "♦️", rank: "7"),
                        Card.init(suit: "♦️", rank: "8"),
                        Card.init(suit: "♦️", rank: "9"),
                        Card.init(suit: "♦️", rank: "10"),
                        Card.init(suit: "♦️", rank: "J"),
                        Card.init(suit: "♦️", rank: "Q"),
                        Card.init(suit: "♦️", rank: "K"),
                     ]
    }
}
