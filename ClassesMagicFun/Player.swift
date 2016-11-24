//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    var name : String
    var wallet : UInt
    var hand : [Card]
    var handSize : UInt
    var handValue : UInt
    var isBlackjack : Bool {
        return handValue == 21
    }
    var isBusted : Bool {
        return handValue > 21
    }
    
    init(name : String) {
        self.name = name
    }
    
    func dealCard(_: Card) {
        self.hand.append(Card)
    }
    
    func willHit(_:UInt) -> Bool {
        if !self.isBusted && !self.isBlackjack{
            return true
        } else {
            return false
        }
    }
    
    func win(_: UInt) {
        self.wallet = self.wallet + UInt
    }
    
    func lose(_: UInt){
        self.wallet = self.wallet - UInt
    }
}
