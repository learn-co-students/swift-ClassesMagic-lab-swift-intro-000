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
        return "\(rank)\(suit)"
    }
    var value: Int {
        var value = 0
        switch rank {
        case "A": value = 1
        case "2": value = 2
        case "3": value = 3
        case "4": value = 4
        case "5": value = 5
        case "6": value = 6
        case "7": value = 7
        case "8": value = 8
        case "9": value = 9
        case "10": value = 10
        case "J": value = 10
        case "Q": value = 10
        case "K": value = 10
        default: value = 0
        }
        return value
    }
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
}
