//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    let name: String
    var wallet: UInt = 0
    var hand: [Card] = []
    var handSize: Int {
        return hand.count
    }
    var handValue: UInt {
        var value = 0
        for card in hand {
            
            // Ace logic (deciding between 1 or 11)
            if ( card.value == 1 ) {
                if ( (value + 11) <= 21 ) { // If adding an ace valued 11 gets us TO or BELOW 21, add 11
                    value += 11
                } else {
                    value += 1 // Otherwise add the ace as valued at 1
                }
            } else {
                value += card.value
            }
            
        }
        return UInt(value)
    }
    var isBlackjack: Bool {
        return handValue == 21
    }
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ currentBet: UInt) -> Bool {
        return ( currentBet <= wallet )
    }
    
    func willHit(_ currentBet: UInt) -> Bool {
        return ( handSize < 21 && canPlaceBet(currentBet) )
    }
    
    func win(_ amount: UInt) {
        wallet += amount
    }
    
    func lose(_ amount: UInt) {
        wallet -= amount
    }
    
}
