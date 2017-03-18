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
        return rank + suit
    }
    
    var value: Int {
        var output: Int
        if let val = Int(rank) {
            output = val
        } else{
            if rank == "A" {
                output = 1
            } else {
                output = 10
            }
        }
        
        return output
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
}


