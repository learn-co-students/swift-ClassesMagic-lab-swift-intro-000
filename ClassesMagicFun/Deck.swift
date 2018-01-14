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
    
    func shuffle(){
        cards.shuffleInPlace()
    }
    
    func drawCard()->Card? {
        if cards.count != 0 {
            return cards[0]
        }
        return nil
    }
}

