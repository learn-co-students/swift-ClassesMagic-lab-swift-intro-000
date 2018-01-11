//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit:String
    let rank:String
    let label:String
    var value:Int {
        get {
            return self.value
        }
        set {
        }
    }
    
    init (rank: String, suit: String) {
        self.suit = suit
        self.rank = rank
        label = "\(self.rank)\(self.suit)"
        switch rank {
        case "A":
            value = 1
        case "10","J","Q","K":
            value = 10
        default:
            value = Int(rank)!
        }
    }
}


