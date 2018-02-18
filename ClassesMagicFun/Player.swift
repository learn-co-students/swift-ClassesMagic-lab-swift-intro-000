//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    let name:String
    
    var wallet:UInt = 200
    var amountWin:UInt = 0
    var amoutLost:UInt = 0
    
    var hand:[Card] = []
    var handSize:Int {
        return hand.count
    }
    
    var handValue:UInt {
        var cardValue:UInt = 0
        for card in hand {
            //print("card.value = \(card.value)")
            //print("card.rank = \(card.rank)")
            cardValue += card.value
        }
        return cardValue
    }
    
    var isBlackjack:Bool {
        if handValue == 21 {
            return true
        }
        return false
    }
    var isBusted:Bool {
        if handValue > 21 {
            return true
        }
        return false
    }
    
    
    init(name:String) {
        self.name = name
    }
    
    func dealCard(card:Card) {
        hand.append(card)
        
    }
    
    func canPlaceBet(bet:UInt) -> Bool {
        if bet < wallet {
            return true
        }
        return false
    }
    
    func willHit(bet:UInt) -> Bool {
        if canPlaceBet(bet: bet) && handValue < 21 {
            wallet-=bet
            amountWin+=(2*bet)
            print("wallet = \(wallet)")
            print("amountWin = \(amountWin)")
            return true
        }
        return false
    }
    
    func win(amount:UInt) -> UInt {
        //print("wallet = \(wallet)")
        wallet+=amountWin
        //print("walletWinnings = \(wallet)")
        return wallet
    }
    
    func lose(amountLost:UInt) -> UInt {
        wallet-=amountWin
        return wallet
    }
    
}
