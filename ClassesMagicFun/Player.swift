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
    var handValue: Int {
        var sum: Int = 0
        var hasAce: Bool = false
        
        for card in hand {
            sum += card.value
            if card.rank == "A" {
                hasAce = true
            }
        }
        if sum <= 10 && hasAce {
            sum += 10
        }
        return sum
    }
    var isBlackjack: Bool {
        return handValue == 21
    }
    
    var isBusted: Bool {
        return handValue > 21
    }
    
    //#8
    init(name: String) {
        self.name = name
        self.wallet = 500
        self.hand = []
        
    }
    
    // #9
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    // #10
    func canPlaceBet(currentBet: UInt) -> Bool {
        return currentBet <= wallet
    }
    
    // #11
    func willHit(currentBet: UInt) -> Bool {
        return canPlaceBet(currentBet: currentBet) && !isBusted
    }
    
    // #12
    func win(amountWon: UInt) {
        wallet += amountWon
    }
    
    // #13
    func lose(amountLost: UInt) {
        wallet -= amountLost
    }
}
