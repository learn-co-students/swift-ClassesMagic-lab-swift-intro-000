//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    let name: String
    var wallet: UInt
    var hand: [Card]
    var handSize: Int
    var handValue: UInt
    var isBlackjack: Bool
    var isBusted: Bool
    
    init(player: String) {
        name = player
    }
    
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        if bet < wallet{
            return true
        }
        return false
    }
    func willHit(bet: UInt) -> Bool {
        if handValue < 21 && bet < wallet{
            return true
        }
        return false
    }
    func win(the bet: UInt){
        wallet = wallet + bet
    }
    func lose(the bet: UInt) {
        wallet = wallet - bet
    }
}
