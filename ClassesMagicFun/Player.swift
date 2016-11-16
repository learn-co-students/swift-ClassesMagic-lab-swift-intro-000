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
            if let eachCard.value == "A" {
                if currentSum < 21 {
                    eachCard.value = 10
                } else {
                    eachCard.value = 1
                }
            }
            currentSum += eachCard.value
        }
        // need to figure out the ace part.
        return UInt(currentSum)
    }
    
    var isBlackJack: Bool {
        return handValue == 21 ? true : false
    }
    
    var isBusted: Bool {
        return handValue > 21 ? true : false
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }

    func dealCard(dealtCard: Card) {
        hand.append(dealtCard)
    }
    
    func canPlaceBet(currentBet: UInt) -> Bool {
        return wallet < currentBet ? true : false
    }
    
    func willHit(currentBet: UInt) -> Bool {
        return canPlaceBet(currentBet: currentBet) && handSize < 21 ? true : false
    }
    
    func win(amountWon: UInt) {
        wallet += amountWon
    }
    
    func lose(amountLost: UInt) {
        wallet -= amountLost
    }
    
}
