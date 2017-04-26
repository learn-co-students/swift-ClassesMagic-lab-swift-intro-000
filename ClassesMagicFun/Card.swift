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
    var label: String{
        return "\(self.rank)\(self.suit)"
    }
    var value: Int{
        switch self.rank{
        case "A":
            return 1
        case "J", "Q", "K":
            return 10
        default:
            return Int(self.rank)!
        }
    }
    
    init(suit: String, rank: String){
        self.suit = suit
        self.rank = rank
    }
  
}


