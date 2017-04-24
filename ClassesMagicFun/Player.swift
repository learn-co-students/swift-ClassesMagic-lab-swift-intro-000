//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    var name: String
    var wallet: UInt
    var hand: [Card]
    var handSize: Int {
        return hand.count
    }
    var handValue: UInt {
        var value = 0
        for c in hand {
            value += c.value
        }
        return UInt(value)
    }
    var isBlackjack: Bool {
        if ( handValue == 21 ) {
            return true
        } else {
            return false
        }
    }
    var isBusted: Bool {
        if ( handValue > 21 ) {
            return true
        } else {
            return false
        }
    }
    
    init(name: String) {
        self.name = name
        wallet = 0
        hand = []
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ currentBet: UInt) -> Bool {
        return currentBet < wallet
    }
    
    func willHit(_ currentBet: UInt) -> Bool {
        if ( self.canPlaceBet(currentBet) && handValue < 21 ) {
            return true
        } else {
            return false
        }
    }
    
    func win(_ currentBet: UInt) {
        wallet += currentBet
    }
    
    func lose(_ currentBet: UInt) {
        wallet -= currentBet
    }
}
