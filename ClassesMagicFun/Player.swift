//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    let name : String
    var wallet : UInt
    var hand : [Card]
    var handSize : Int {
        return hand.count
    }
    var handValue : UInt {
        var sum : UInt = 0
        for card in hand {
            sum += UInt(card.value)
        }
        return sum
    }
    
    var isBlackjack: Bool {
        return handValue == 21
    }
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
        wallet = 100
        hand = []
    }
    
    func dealCard(card: Card) {
        hand.append(card)
    }
   
    func canPlaceBet(bet: UInt) -> Bool {
        return bet < wallet
    }
    
    func willHit(bet: UInt) -> Bool {
        return handValue < 21 && canPlaceBet(bet: bet)
    }
    
    func win(bet: UInt) {
        wallet += bet
    }
    
    func lose(bet: UInt) {
        wallet -= bet
    }
    
}
