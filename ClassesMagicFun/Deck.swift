//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    
    var cards:[Card] = []
    //private var deckIndex = -1
    init() {
        createDeck()
    }
    
    func createDeck() {
        let cardRanks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suits = [ "♠︎","♥︎","♦︎","♣︎"]
        var cards:[Card] = []
        for suit in suits {
            for rank in cardRanks {
                let tempCard = Card(suit: suit, rank: rank)
                cards.append(tempCard)
            }
        }
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if cards.count != 0 {
            return cards[0]
        }
        return nil
    }
    
}

