//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    var cards: [Card] = {
       return Deck.createDeck()
    }()
    
    fileprivate static func createDeck() -> [Card] {
        var deck = [Card]()
        
        for i in 1...4 {
        var suit = ""
        
        switch i {
        case 1: suit = "♠️"
        case 2: suit = "♥️"
        case 3: suit = "♣️"
        default: suit = "♦️"
        }
        
        for j in 1...13 {
        var rank = ""
        
        switch j {
        case 1: rank = "A"
        case 11: rank = "J"
        case 12: rank = "Q"
        case 13: rank = "K"
        default: rank = "\(j)"
        }
        
        deck.append(Card.init(suit: suit, rank: rank))
        }
        }
        return deck
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if cards.isEmpty {
            return nil
        } else {
            let cardToDeal = cards[0]
            cards.remove(at: 0)
            return cardToDeal
        }
    }
    
}
