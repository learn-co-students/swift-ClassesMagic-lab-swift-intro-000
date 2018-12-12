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
        get {
            return "\(self.rank) \(self.suit)"
        }
    }
    
    var value: Int {
        get {
            switch (self.rank) {
            case "J", "Q", "K":
                return 10
            case "A":
                return 1
            default:
                return Int(self.rank)!
            }
        }
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
  
}


