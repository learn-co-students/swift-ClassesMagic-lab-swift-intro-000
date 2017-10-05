//
//  Deck.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    
    var cards : [Card];
    var hasCards : Bool {
        if(cards.count > 0) {
            return true;
        }
        return false;
    }
    
    func shuffle() {
        cards.shuffleInPlace();
    }
    
    func drawCard() -> Card? {
        if(hasCards) {
            return cards.remove(at: 0)
        }
        return nil;
    }
    
    init() {
        cards = [];
    }
}
