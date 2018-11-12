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
        return "\(rank)\(suit)"
    }
    var value: Int {
        switch rank {
        case "A":
            return 1
        case "K", "Q", "J":
            return 10
        default:
            if let cardValue = Int(rank) {
                return cardValue
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
