//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    let name: String
    var wallet: UInt = 0
    var hand: [Card] = []
    var handSize: Int = 0
    var handValue: UInt {
        var totalValue = 0
        for card in hand {
            totalValue += card.value
        }
        return UInt(totalValue)
    }
    var isBlackjack: Bool {
        var blackJack: Bool
        if self.handValue == 21 {
            blackJack = true
        }
        else {
            blackJack = false
        }
        return blackJack
    }
    var isBusted: Bool {
        var busted: Bool
        if self.handValue > 21 {
            busted = true
        }
        else {
            busted = false
        }
        return busted
    }
    
    init(name: String) {
        self.name = name
    }
    
    func dealCard(_ card: Card) {
        self.hand.append(card)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        if bet <= self.wallet {
            return true
        }
        else {
            return false
        }
    }
    
    func willHit(bet: UInt) -> Bool {
        if bet <= self.wallet && self.handValue < 21 {
            return true
        }
        else {
            return false
        }
    }
    
    func win(_ amountWon: UInt) {
        self.wallet += amountWon
    }
    
    func lose(_ amountLost: UInt) {
        self.wallet -= amountLost
    }
    
}
