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
    var hand: [Card] = []
    var handSize: Int {
        get {
            return hand.count
        }
    }
    var handValue: UInt {
        get {
            var sum = 0
            for card in hand {
                switch card.rank {
                case "A":
                    if sum + Int(card.value) + 10 > 21 {
                        let aceValue = 1
                        sum += aceValue
                    } else if sum + Int(card.value) + 10 <= 21 {
                        let aceValue = 11
                        sum += aceValue
                    }
                default:
                    sum += Int(card.value)
                }
            }
            return UInt(sum)
        }
    }
    var isBlackjack: Bool {
        get {
            if self.handValue == 21 {
                return true
            }
            return false
        }
    }
    var isBusted: Bool {
        get {
            if self.handValue > 21 {
                return true
            }
            return false
        }
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        if bet < self.wallet {
            return true
        }
        return false
    }
    
    func willHit(_ bet: UInt) -> Bool {
        if bet < self.wallet && self.handValue < 21 {
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
