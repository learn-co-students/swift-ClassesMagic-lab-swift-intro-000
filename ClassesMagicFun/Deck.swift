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
    
    init() {
        
        var cardCount = 1
        
        // Populates deck w/ cards
        while cardCount <= 13 {
            if ( cardCount == 1 ) { // Ace
                createCard("A")
            } else if ( cardCount == 11 ) { // Jack
                createCard("J")
            } else if ( cardCount == 12 ) { // Queen
                createCard("Q")
            } else if ( cardCount == 13 ) { // King
                createCard("K")
            } else { // Any other cards (2,3,4,etc)
                createCard(String(cardCount))
            }
            
            cardCount += 1
            
        }
        
    }
    
    func createCard(_ cardRank: String) {
        self.cards.append(Card.init(suit: "♠️", rank: cardRank))
        self.cards.append(Card.init(suit: "♣️", rank: cardRank))
        self.cards.append(Card.init(suit: "♥️", rank: cardRank))
        self.cards.append(Card.init(suit: "♦️", rank: cardRank))
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if cards.count > 0 {
            
            let cardDrawn: Card? = cards.first
            
            // Remove the card from the deck after being drawn
            cards.remove(at: 0)
            
            return cardDrawn
            
        }
        
        return nil
        
    }
    
}
