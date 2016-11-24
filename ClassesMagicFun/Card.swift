//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
/*
    var suit : String
    var rank : String
    var label : String {
        return "\(rank)\(suit)"
    }
    var value: value{
        switch rank {
        case "10":
            return 10
        case "9":
            return 9
        case "8":
            return 8
        case "7":
            return 7
        case "6":
            return 6
        case "5":
            return 5
        case "4":
            return 4
        case "3":
            return 3
        case "2":
            return 2
        default:
            return 1
        }
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
 */
    
    let suit: String
    let rank: String
    var label: String {
        return rank + suit
    }
    var value: UInt {
        switch rank {
        case "A":
            return 1
        case "J", "K", "Q":
            return 10
        default:
            if let value = UInt(rank) {
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
