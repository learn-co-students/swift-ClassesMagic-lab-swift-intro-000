//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    var label: String {
        return rank + suit
    }
    var value: Int {
        switch rank {
        case "J","Q","K":
            return 10
        case "A":
            return 1
        default:
            if let value = Int(rank) {
                return value
            } else {
                return 0
            }
        }
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
}


