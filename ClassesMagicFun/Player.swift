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
    var wallet: UInt
    var hand: [Card] = []
    var handSize: Int
    
    init(name: String)
    {
     self.name = name
    }
    
    var handValue: UInt
    {
        var sum: UInt = 0
        
        for (card) in hand
        {
            if card.rank == "A" && sum <= 10
            {
                return sum + 11
            }
            else
            {
                sum += card.value
            }
        }
        return sum
    }
    
    var isBlackJack: Bool
    {
        get
        {
            if (self.handValue == 21)
            {
                return true
            }
            else
            {
                return false
            }
        }
    }
    var isBusted: Bool
    {
        get
        {
            if (self.handValue > 21)
            {
            return true
            }
            else
            {
            return false
            }
        }
    }
    func dealerCard(_ giveCard: Card)
    {
        hand.append(giveCard)
    }
    
    func canPlaceBet(_ currentBet: UInt) -> Bool
    {
        return currentBet <= self.wallet
    }
    
    func willHit(_ currentBet: UInt) -> Bool
    {
        if(self.wallet > currentBet) && (self.handValue < 21)
        {
            return true
        }
            return false
    }
    
    func win(_ hasWon: UInt)
    {
        self.wallet += hasWon
    }

    func lose(_ hasLost: UInt)
    {
        self.wallet -= hasLost
    }
}






























