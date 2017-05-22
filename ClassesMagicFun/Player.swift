//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    var name: String
    var wallet: UInt = 200
    var hand: [Card] = []
    var handSize: Int {
        return hand.count
    }
    var handValue: UInt {
        var value: UInt = 0
        for card in hand {
            value += card.value
        }
        
        return value
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
        return bet < wallet
    }
    
    func willHit(_ bet: UInt) -> Bool {
        return canPlaceBet(bet) && handSize < 21
    }
    
    func win(_ amount: UInt) {
        wallet += amount
    }
    
    func lose(_ amount: UInt) {
        wallet -= amount
    }
}
