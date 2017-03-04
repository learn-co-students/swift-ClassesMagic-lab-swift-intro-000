//
//  Player.swift
//  ClassesMagicFun
//  Copyright © 2016 Flatiron School. All rights reserved.

// DataComm Network Solutions

class Player {
    
    var name: String
    var hand:[Card] = []
    var wallet:UInt = 100
    var handSize: Int{
        return hand.count
    }
    
    init(name: String){
        self.name = name
        //self.wallet = wallet
         }
    
    var handValue: UInt{
        var sum:UInt = 0
        for(card) in hand{
            if card.rank == "A" && sum <= 10 {
                return sum + 11
            } else{
            sum += card.value
            }
        }
        return sum
    }

    var isBlackjack:Bool{
        get {
            if(self.handValue == 21 && self.hand.count == 2){
                return true
            } else {
                return false
            }
        }
    }

    var isBusted: Bool{
        get {
            if(handValue > 21){
                return true
            }else {
                return false
            }
        }
    }
    

    
      func dealCard(hitCard:Card){
        hand.append(hitCard)
    }
    
    func canPlaceBet(currentBet:UInt)->Bool{
        return currentBet <=  self.wallet   }
    
    func willHit(currentBet:UInt)->Bool{
        if(canPlaceBet(currentBet)) && (self.handValue < 21){
            return true
        }
        return false
    }
    
    func win(hasWon:UInt){
        self.wallet += hasWon
    }
    
    func lose(hasLost:UInt){
        self.wallet -= hasLost
    }
}
