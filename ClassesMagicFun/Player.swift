//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    var name: String
    var wallet: UInt = 100
    var hand: [Card] = []
    var handSize: Int = 0
    var handValue: UInt {
        var value: UInt = 0
        for c in hand {
            if let v = UInt(c.rank) {
                value = value + v
            } else {
                if c.rank == "A" {
                    value = value + 1
                } else {
                    value = value + 10
                }
            }
        }
        return 0
    }
    var isBlackjack: Bool {
        return handValue == 21
    }
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        return bet <= wallet
    }
    
    func willHit(_ bet: UInt) -> Bool {
        return bet <= wallet && handValue < 21
    }
    
    func win(_ win: UInt) {
        wallet = wallet + win
    }
    
    func lose(_ losses: UInt) {
        wallet = wallet - losses
    }
}
