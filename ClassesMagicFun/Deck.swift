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
    
    init(){
        
        self.nextCard = 0
        self.cards = []
        generateDeck()
        shuffle()
    }
    
    func shuffle(){
        cards.shuffleInPlace()
    }
    
    func drawCard()->Card?{
        print(nextCard, cards.count)
        guard nextCard < cards.count else { print("true boo"); return nil }
        let card = cards[nextCard]
        nextCard += 1
        return card
    }
    
    func generateDeck(){
        
        for suit in ["♠️", "♣️", "♥️", "♦️"] {
            for rank in ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"] {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
    }
    
    
}
