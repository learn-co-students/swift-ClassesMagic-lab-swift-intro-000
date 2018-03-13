//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    
    var suit: String {
        let suitArray = ["♠️", "♣️", "❤️", "♦️"]
        return suitArray[Int(arc4random_uniform(3))]
    }
    var rank: String {
        let rankArray = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        return rankArray[Int(arc4random_uniform(12))]
    }
    var label: String {
        return ("\(rank)\(suit)")
    }
    var value: Int {
        var value = 0
        if Int(rank)! <= 10 {
            value += Int(rank)!
        }
        else if rank == "J" || rank == "Q" || rank == "K" {
            value += 10
        }
        else if rank == "A" {
        }
        return value
    }
    
    init(suit: String, rank: String) {
        
    }
    
    
}


