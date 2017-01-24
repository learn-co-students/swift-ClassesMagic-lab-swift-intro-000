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
    // Looked at solutions for this part beacuse I was confused. Also my solution was considerably more intense and elongated.
    // thought of running a function that creates a constant card, which gets appended. so let aceOf2 = Card(suit: suit, rank: rank), but couldnt figure it out to do this programmatically and without using regex.
    init() {
        cards = []
        nextCard = 0
        
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
    }
    
    func shuffle() {
        nextCard = 0
        cards.shuffleInPlace()
        // did I overthink the directions for this?
    }
    
    func drawCard() -> Card? {
        guard nextCard < cards.count else { return nil }
        let card = cards[nextCard]
        nextCard += 1
        return card
    }
}
