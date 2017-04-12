//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck
{
    var cards: [Card] = []
    
    
    func shuffle()
    {
        cards.shuffleInPlace()
    }
    
    var cardCount:UInt = 0
    func drawCard() ->Card? {
        
        if(!cards.isEmpty){
            for(card) in self.cards{
                _ = Card(suit: card.suit, rank: card.rank)
                cardCount += 1
                return cards.popLast()!
            }
        }
        return nil
    }

    
    
    
}
