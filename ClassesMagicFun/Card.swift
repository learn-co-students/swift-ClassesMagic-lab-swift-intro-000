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
        return suit + rank
    }
    var value: UInt {
        let rankInt: UInt? = UInt(rank)
        if let rankNumberCard = rankInt {
            return rankNumberCard
        } else if rank == "A" {
            return 1
        } else {
            //Must be JQK
            return 10
        }
    }
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
    
  
}


