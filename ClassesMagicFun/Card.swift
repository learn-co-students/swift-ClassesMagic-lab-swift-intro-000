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
    var value: Int{
        
        return calculateValue(self.rank)
    }
    
    var label: String{
        return "\(self.rank)\(self.suit)"
    }
    
    init(suit: String, rank: String){
        
        self.suit = suit
        self.rank = rank
    }
    
    func calculateValue(rank: String)->Int{
        
        switch rank {
        case "K", "Q", "J":
            return 10
        case "A":
            return 1
        default:
            return Int(rank)!
        }
        
    }
}
