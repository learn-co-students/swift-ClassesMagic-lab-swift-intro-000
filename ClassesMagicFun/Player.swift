//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    var name:String
    var wallet:UInt
    var hand:[Card]
    var handSize:Int
    var handValue:UInt
    var isBlackjack:Bool
    var isBusted:Bool
    
    init(name: String) {
        self.name = name
        wallet = 0
        hand = []
        handSize = 0
        handValue = 0
        isBlackjack = false
        isBusted = false
    }
    
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        if bet < wallet {
            return true
        }
        else {
            return false
        }
    }
    
    func willHit(_ bet: UInt) -> Bool {
        if canPlaceBet(bet) && handValue < 21 {
            return true
        }
        else {
            return false
        }
    }
    
    func win(amountWon: UInt) {
        wallet += amountWon
    }
    
    func lose(amountLost: UInt) {
        wallet -= amountLost
    }
    
    func didWin() -> Bool {
        if handValue == 21 {
            isBlackjack = true
            return true
        } else {
            return false
        }
    }
    
    func didLose() -> Bool {
        if handValue > 21 {
            isBusted = true
            return true
        } else {
            return false
        }
    }
}
