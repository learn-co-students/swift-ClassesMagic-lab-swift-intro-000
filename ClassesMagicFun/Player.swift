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
    var isBlackjack:Bool{return handValue == 21}
    var isBusted:Bool{return handValue > 21}
    var handValue: UInt{
        var value: UInt = 0
        var hasAce = false
        for card in hand{
            value += UInt(card.value)
            if card.rank == "A"{
                hasAce = true
            }
        }
        if value <= 11 && hasAce == true{
            value += 10
        }
        return value
    }
    
    init(name: String){
        
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    
    func dealCard(card: Card){
        
        hand.append(card)
    }
    
    func canPlaceBet(currentBet: UInt)->Bool{
        
        return wallet >= currentBet
    }
    
    func willHit(currentBet: UInt)->Bool{
        
        if handValue >= 21{
            return false
        }else if handValue < 21 && canPlaceBet(currentBet){
            return true
        }
        
        return false
    }
    
    func win(winnings:UInt){
        wallet += winnings
    }
    
    func lose(loses:UInt){
        wallet -= loses
    }
    
    
}












