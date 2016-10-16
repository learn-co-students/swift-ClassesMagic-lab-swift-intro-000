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
        let aces1 = hand.reduce(0) { (sum, card) in
            return sum + Int(card.value)
        }
        let aces10 = hand.reduce(0) { (sum, card) in
            let value = card.rank == "A" ? 11 : card.value
            return sum + Int(value)
        }
        if aces10 <= 21 {
            return UInt(aces10)
        } else {
            return UInt(aces1)
        }
    }
    var isBlackjack: Bool {
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
    func dealCard(card: Card) {
        hand.append(card)
    }
    func canPlaceBet(bet: UInt) -> Bool {
        if wallet >= bet {
            return true
        } else {
            return false
        }
    }
    func willHit(bet: UInt) -> Bool{
        if canPlaceBet(bet: bet) && handSize < 21 {
            return true
        } else {
            return false
        }
    }
    func win(amount: UInt) {
        wallet += amount
    }
    func lose(amount: UInt) {
        wallet -= amount
    }
}
