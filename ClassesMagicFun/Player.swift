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
    var handSize: Int
    var handValue: UInt {
        var value: UInt = 0
        for card in hand {
            if card.rank == "A" && value <= 10 {
                value += 11
            } else {
                value += UInt(abs(card.value))
            }
        }
        return value
        }
    var isBlackjack: Bool {
        if handValue == 21 {return true}
        else {return false}
    }
    var isBusted: Bool {
        if wallet == 0 {return true}
        else {return false}
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 0
        self.hand = []
        self.handSize = 0
    }
    
    func dealCard(_ addCard: Card) {
        self.hand.append(addCard)
        self.handSize += 1
    }
    
    func canPlaceBet(_ betAmount: UInt) -> Bool {
        var hasEnough = false
        if self.wallet <= betAmount {hasEnough = true}
        return hasEnough
    }
    
    func willHit(_ betAmount: UInt) -> Bool {
        var hitMe = false
        if canPlaceBet(betAmount) && self.handValue < 21 {hitMe = true}
        return hitMe
    }
    
    func win(_ inThePot: UInt) {
        self.wallet += inThePot
    }
    
    func lose(_ totalBet: UInt) {
        self.wallet -= totalBet
    }
    
}
