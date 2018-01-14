//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    //initializers
    
    init(name: String) {
        self.name = name
    }
    
    var name: String
    var wallet: UInt
    var hand: [Card] //need to specify what type this is, need to be defined as Card to be able to use
    //the Card methods
    var handSize: Int
    var handValue: UInt {
        var sum: UInt = 0
        for card in hand {
            if card.rank == "A" && sum <= 10 {
                 sum += 11
            }else{
               sum += card.value
            }
        }
       return sum
    }
    
    var isBlackJack: Bool {
        get {
            if self.handValue == 21 {
                return true
            }else{
                return false
            }
        }
    }
    
    var isBusted: Bool {
        if self.handValue > 21 {
            return true
        }else{
            return false
        }
    }
    
    func dealCard(_ card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(_ bet:UInt)->Bool {
        if !(bet > self.wallet) {
            return true
        }else{
            return false
        }
    }
    
    func willHit(_ bet:UInt)->Bool {
        if ( !(bet>self.wallet) && self.handSize<21) {
            return true
        }else{
            return false
        }
    }
    func win(_ won:UInt) {
        self.wallet += won
    }
    func lose(_ lost:UInt){
        self.wallet -= lost
    }
}

