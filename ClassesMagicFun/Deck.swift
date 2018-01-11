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
    
    init() {
        //add the spades
        cards.append(Card(rank: "A",suit: "♠️"))
        cards.append(Card(rank: "2",suit: "♠️"))
        cards.append(Card(rank: "3",suit: "♠️"))
        cards.append(Card(rank: "4",suit: "♠️"))
        cards.append(Card(rank: "5",suit: "♠️"))
        cards.append(Card(rank: "6",suit: "♠️"))
        cards.append(Card(rank: "7",suit: "♠️"))
        cards.append(Card(rank: "8",suit: "♠️"))
        cards.append(Card(rank: "9",suit: "♠️"))
        cards.append(Card(rank: "10",suit: "♠️"))
        cards.append(Card(rank: "J",suit: "♠️"))
        cards.append(Card(rank: "Q",suit: "♠️"))
        cards.append(Card(rank: "K",suit: "♠️"))
        
        //add the hearts
        cards.append(Card(rank: "A",suit: "♥️"))
        cards.append(Card(rank: "2",suit: "♥️"))
        cards.append(Card(rank: "3",suit: "♥️"))
        cards.append(Card(rank: "4",suit: "♥️"))
        cards.append(Card(rank: "5",suit: "♥️"))
        cards.append(Card(rank: "6",suit: "♥️"))
        cards.append(Card(rank: "7",suit: "♥️"))
        cards.append(Card(rank: "8",suit: "♥️"))
        cards.append(Card(rank: "9",suit: "♥️"))
        cards.append(Card(rank: "10",suit: "♥️"))
        cards.append(Card(rank: "J",suit: "♥️"))
        cards.append(Card(rank: "Q",suit: "♥️"))
        cards.append(Card(rank: "K",suit: "♥️"))
        
        //add the diamonds
        cards.append(Card(rank: "A",suit: "♦️"))
        cards.append(Card(rank: "2",suit: "♦️"))
        cards.append(Card(rank: "3",suit: "♦️"))
        cards.append(Card(rank: "4",suit: "♦️"))
        cards.append(Card(rank: "5",suit: "♦️"))
        cards.append(Card(rank: "6",suit: "♦️"))
        cards.append(Card(rank: "7",suit: "♦️"))
        cards.append(Card(rank: "8",suit: "♦️"))
        cards.append(Card(rank: "9",suit: "♦️"))
        cards.append(Card(rank: "10",suit: "♦️"))
        cards.append(Card(rank: "J",suit: "♦️"))
        cards.append(Card(rank: "Q",suit: "♦️"))
        cards.append(Card(rank: "K",suit: "♦️"))
        
        //add the clubs
        cards.append(Card(rank: "A",suit: "♣️"))
        cards.append(Card(rank: "2",suit: "♣️"))
        cards.append(Card(rank: "3",suit: "♣️"))
        cards.append(Card(rank: "4",suit: "♣️"))
        cards.append(Card(rank: "5",suit: "♣️"))
        cards.append(Card(rank: "6",suit: "♣️"))
        cards.append(Card(rank: "7",suit: "♣️"))
        cards.append(Card(rank: "8",suit: "♣️"))
        cards.append(Card(rank: "9",suit: "♣️"))
        cards.append(Card(rank: "10",suit: "♣️"))
        cards.append(Card(rank: "J",suit: "♣️"))
        cards.append(Card(rank: "Q",suit: "♣️"))
        cards.append(Card(rank: "K",suit: "♣️"))

        shuffle()
    }
    
    func shuffle() {
        cards.shuffleInPlace()
    }
    
    func drawCard() -> Card? {
        if !cards.isEmpty {
            return cards.removeFirst()
        } else {
            return nil
        }
    }
    
    func isFullyDealt() -> Bool {
        if !cards.isEmpty {
            return false
        }
        else {
            return true
        }
    }
}
