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
    var handSize: Int {
        return hand.count
    }
    var handValue: UInt {
        var value = 0
        for card in hand {
            value += card.value
        }
        return UInt(value)
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
        self.hand.append(card)
    }
    func canPlaceBet(_ bet: UInt) -> Bool {
        return bet < self.wallet
    }
    func willHit(_ bet: UInt) -> Bool {
        return self.canPlaceBet(bet) && self.handSize < 21
    }
    func win(_ amount: UInt) {
        wallet += amount
    }
    func lose(_ amount: UInt) {
        wallet -= amount
    }
}
