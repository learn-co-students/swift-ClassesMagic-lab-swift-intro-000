//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit:String
    var rank:String
    var label:String
    
    var value:UInt {
        let cardSum = getValue(rank: rank)
        return cardSum
    }
    
    init(suit:String,rank:String) {
        self.suit = suit
        self.rank = rank
        self.label = rank+suit
        
    }
    
    func getValue(rank:String) -> UInt {
        
        switch rank {
        case "2","3","4","5","6","7","8","9","10":
            return UInt(rank)!
        case "A":
            return 1
        case "J":
            return 10
        case "Q":
            return 10
        case "K":
            return 10
        default:
            return 0
        }
    }
    
}




