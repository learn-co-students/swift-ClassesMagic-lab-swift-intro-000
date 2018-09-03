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
        return "\(rank) \(suit)"
    }
    var value: Int{
        switch rank {
        case "A":
            return 1
        case "K":
            return 10
        case "Q":
            return 10
        case "J":
            return 10
        default:
            return Int(rank) ?? 0
        }
        
    }
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
}


