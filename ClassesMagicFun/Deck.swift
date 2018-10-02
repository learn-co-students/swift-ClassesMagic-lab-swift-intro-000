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
    var suits = ["♠️","♦️","❤️","♦️"]
    var ranks = ["A","K","Q","J","10","9","8","7","6","5","4","3","2"]
    
    init () {
        cards = []
        for suit in suits {
            for rank in ranks {
                let generateCard = Card(suit: suit, rank: rank)
                cards.append(generateCard)
            }
        }
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if cards.count > 0 {
            let cardToDraw = cards[cards.startIndex]
            cards.remove(at: cards.startIndex)
            return cardToDraw
        } else {
            return nil
        }
    }
}
