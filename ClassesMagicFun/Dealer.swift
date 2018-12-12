//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck: Deck
    var player: Player
    var house: House
    var winner: Player?
    
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
    }
    
    func deal() {
        self.player.dealCard(self.deck.drawCard()!)
        self.player.dealCard(self.deck.drawCard()!)
        if self.player.isBlackjack {
            self.winner = self.player
        }
        self.house.dealCard(self.deck.drawCard()!)
        self.house.dealCard(self.deck.drawCard()!)
        if self.house.isBlackjack {
            self.winner = self.house
        }
    }
    
    func turn(_ player: Player) {
        while player.willHit(100) {
            player.dealCard(deck.drawCard()!)
        }
    }
    
    func award(_ bet: UInt) {
        if winner!.name == "Player" {
            player.wallet += bet
            house.wallet -= bet
        } else {
            player.wallet -= bet
            house.wallet += bet
        }
    }
}
