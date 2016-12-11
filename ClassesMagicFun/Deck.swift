//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    
    let suit = ["♣️","♦️","♠️","♥️",]
    let rank = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    var cards:[Card] = []
    
    func shuffle(){
        cards.shuffleInPlace()
    }
    
    func createDeck(){
        for(cardSuit) in suit{
            for(cardRank) in rank{
                cards.append(Card(suit: cardSuit, rank: cardRank))
            }
        }
    }
    
    init(){
        createDeck()
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
    func nextCard(){
    }
}
