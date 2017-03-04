//
//  Deck.swift
//  ClassesMagicFun
//  Copyright © 2016 Flatiron School. All rights reserved.

//  DataComm Network Solutions

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
         cards.shuffleInPlace()
    }
    
    init(){
        createDeck()
    }
    
    func drawCard() ->Card? {
       
        if(!cards.isEmpty){
            for(card) in self.cards{
                _ = Card(suit: card.suit, rank: card.rank)
               
               return cards.popLast()!
            }
        }
        return nil
    }
}
