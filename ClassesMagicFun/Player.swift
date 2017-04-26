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
    var handSize: Int{
        return hand.count
    }
    var handValue: UInt{
        var r_val: UInt = 0
        for card in hand{
            r_val += UInt(card.value)
        }
        return r_val
    }
    
    var isBlackJack: Bool{
        if(self.handValue == 21){
            return true
        }
        return false
    }
    
    var isBusted: Bool{
        if(self.handValue > 21){
            return true
        }
        return false
    }
    
    init(name: String){
        self.name = name
        self.wallet = 1000
        self.hand = []
    }
    
    func dealCard(_ new_card: Card){
        self.hand.append(new_card)
    }
    
    func canPlaceBet(_ bet: UInt) -> Bool {
        return bet < self.wallet
    }
    
    func willHit(_ bet: UInt) -> Bool {
        if(self.handValue < 21 && self.canPlaceBet(bet)){
            return true
        }
        return false
    }
    
    func win(_ winnings: UInt){
        self.wallet += winnings
    }
    
    func lose(_ loss: UInt){
        self.wallet -= loss
    }
		
}
