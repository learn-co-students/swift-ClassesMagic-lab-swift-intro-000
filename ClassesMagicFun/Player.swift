//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player
{
    var name: String
    var wallet: UInt = 0
    var hand: [Card]
    var handSize: Int = 0
    var handValue: UInt = 0
    var isBlackjack: Bool = false
    var isBusted: Bool = false
    
    init(name: String)
    {
        self.name = name
        self.hand = []
    }
    
    func dealCard(card: Card)
    {
        //add to hand
        hand.append(card)
    }
    
    func canPlaceBet(currentBet: UInt ) -> Bool
    {
        if currentBet <= wallet
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func willHit (currentBet: UInt) -> Bool
    {
        if canPlaceBet(currentBet: currentBet) && (handValue <= 21)
        {
            return true
        }
        else
        {
            return false
        }
        
    }
    
    func win (winAmount: UInt)
    {
        //update Wallet
        wallet += winAmount
    }
    
    func lose (loseAmount: UInt)
    {
        //update wallet
        wallet -= loseAmount
    }
}
