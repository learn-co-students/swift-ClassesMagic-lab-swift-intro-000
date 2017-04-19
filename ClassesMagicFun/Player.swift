//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    var name: String
    
    var wallet: UInt = 0
    
    var hand: [Card] = []
    
    var handSize: Int = 0
    
    var handValue: UInt  {
        
        get {
            var value: UInt = 0
            for card in hand {
                 value += card.value
            }
            return value
        }
    }
    
    var isBlackJack: Bool {
        
        get {
            if handValue == 21 {
                return true
            }
            return false
        }
    }
    
    var isBusted: Bool {
    
        if handValue > 21 {
            return true
        }
        return false
    }
    
    init(name: String) {
        self.name = name
    }
    
    func dealCard(_ card: Card) {
        handSize += 1
        hand.append(card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        
        if bet < wallet {
            return true
        }
        return false
    }
    
    func willHit(_ currentBet: UInt) -> Bool {
        
        if handValue < 21 && wallet > currentBet {
            return true
        }
        return false
    }
    
    func win(_ amountWon: UInt) {
        
        wallet += amountWon
    }
    
    func lose(_ amountLost: UInt) {
        
        wallet -= amountLost
    }
}
