//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit: String
    var rank: String
    var label: String {
        return "\(rank) \(suit)"
    }
    var value: Int {
        switch rank {
        case "A":
            return 1
        case "J", "Q", "K":
            return 10
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
