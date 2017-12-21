//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    let name : String
    var wallet : UInt
    var hand : [Card] = []
    var handSize : Int {
        get {
            return hand.count
        }
    }
    var handValue : UInt {
        get {
            var sum : UInt = 0
            for card in hand {
                sum += UInt(card.value)
            }
            return sum
        }
    }
    var isBlackJack : Bool {
        get {
            if(self.handValue == 21) {
                return true
            }
            return false
        }
    }
    var isBusted : Bool {
        get {
            if(self.handValue > 21) {
                return true
            }
            return false
        }
    }
    
    init(name : String) {
        self.name = name
        self.wallet = 100
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        if(bet < self.wallet) {
            return true
        }
        return false
    }
    
    func willHit(_ bet: UInt) -> Bool {
        if(bet < self.wallet && self.handSize < 21) {
            return true
        }
        return false
    }
    
    func win(_ amount: UInt) {
        self.wallet += amount
    }
    
    func lose(_ amount: UInt) {
        self.wallet -= amount
    }
    
}
