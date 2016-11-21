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
        // Ended up using the solution one for this because my initial attempt with filter then reduce seemed
        // unnecessarily long and inelegant. Will refactor this to my own later when I understand the methods better.
        let aces1 = hand.reduce(0) { (sum, card) in
            return sum + Int(card.value)
        }
        
        let aces10 = hand.reduce(0) {
            (sum, card) in
            let value = card.rank == "A" ? 11 : card.value
            return sum + Int(value)
        }
        
        if aces10 <= 21 {
            return UInt(aces10)
        } else {
            return UInt(aces1)
        }
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
