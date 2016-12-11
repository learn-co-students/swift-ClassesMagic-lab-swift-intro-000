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
        get{
            return self.rank + "" + self.suit
        }
    }
    
    var value: UInt{
        get{
            switch rank{
            case "J","Q","K":
                return 10
            case "A":
                return 1
            default:
                return UInt(rank)!
            }
        }
    }
    
    init(suit: String, rank: String){
        self.suit = suit
        self.rank = rank
    }
}
