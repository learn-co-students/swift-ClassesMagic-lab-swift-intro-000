//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    var name:String
    var wallet:UInt
    var hand:[Card] //could be init here this, just add " = []"
    var handSize:Int{
        get{
            return hand.count
        }
    }
    var handValue:UInt{
        var sum:UInt = 0
        for card in hand{
            sum += UInt(card.value)
        }
        return sum
    }
    var isBlackJack:Bool{
        if (self.handValue == 21) {
            return true
        }else{
            return false
        }
    }
    var isBusted:Bool{
        if (self.handValue > 21){
            return true
        }
        return false
    }
    init(name:String) {
        self.name = name
        self.hand = []
        self.wallet = 100 //There's not the instruction of money
    }
    func dealCard(_ card:Card){
        hand.append(card)
    }
    func canPlaceBet(_ bet:UInt) -> Bool{
        if (bet < self.wallet){ //can place the bet if the hand is not correct
                                //so need to chech if (self.handValue < 21)
            return true
        }
        return false
    }
    func willHit(_ currentBet:UInt) -> Bool {
        if (canPlaceBet(currentBet))&&(self.handSize < 21) {
            return true
        }
        return false
    }
    func win(_ amount:UInt){
        //add the amount to the wallet
        self.wallet += amount
    }
    func lose(_ amount:UInt){
        //substract the amount to the wallet
        self.wallet -= amount
    }
}
