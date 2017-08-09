//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit: String = ""
    var rank: String = ""
    var label: String = ""
    var value: Int {
        var faceValue: Int = 0
            switch rank {
            case "A":
                faceValue = 1
            case "2", "3","4", "5", "6", "7", "8", "9", "10":
                faceValue = Int(rank)!
            case "J", "Q", "K":
                faceValue = 10
            default:
                break
            }
        return faceValue
        }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
  
}


