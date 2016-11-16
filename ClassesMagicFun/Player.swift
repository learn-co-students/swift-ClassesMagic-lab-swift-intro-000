//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    let name: String
    var wallet: UInt
    var hand: [Card]
    var handSize: Int {
        return hand.count
    }
    
    var handValue: UInt {
        var currentSum = 0
        for eachCard in hand {
            currentSum += eachCard.value
        }
        // need to figure out the ace part.
        return UInt(currentSum)
    }
    
    var isBlackJack: Bool {
        if handValue == 21 {
            return true
        } else {
            return false
        }
    }
    
    var isBusted: Bool {
        if handValue > 21 {
            return true
        } else {
            return false
        }
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    // returns error that it hasn't initialized all stored properties, differs from instructions.
    func dealCard(dealtCard: Card) {
        hand.append(dealtCard)
    }
    
    func canPlaceBet(currentBet: UInt) -> Bool {
        if wallet < currentBet {
            return true
        } else {
            return false
        }
    }
    
    func willHit(currentBet: UInt) -> Bool {
        if canPlaceBet(currentBet: currentBet) && handSize < 21 {
            return true
        } else {
            return false
        }
    }
    
    func win(amountWon: UInt) {
        wallet += amountWon
    }
    
    func lose(amountLost: UInt) {
        wallet -= amountLost
    }
    
}
