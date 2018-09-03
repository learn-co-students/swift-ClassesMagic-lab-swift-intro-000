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
    var handSize: Int = 0
    var handValue: UInt = 0
    var isBlackjack: Bool = false
    var isBusted: Bool = false
    
    init(player: String) {
        self.name = player
    }
    
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return bet < wallet
    }
    func willHit(bet: UInt) -> Bool {
         return handValue < 21 && bet < wallet
    }
    func win(the bet: UInt){
        wallet = wallet + bet
    }
    func lose(the bet: UInt) {
        wallet = wallet - bet
    }
}
