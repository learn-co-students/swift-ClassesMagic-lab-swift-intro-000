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
    var bet: UInt = 0
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
    }
    func deal() {
        self.player.hand.append(self.deck.drawCard()!)
        self.player.hand.append(self.deck.drawCard()!)
        self.house.hand.append(self.deck.drawCard()!)
        self.house.hand.append(self.deck.drawCard()!)
        if player.isBlackjack {
            self.winner = player
        } else if house.isBlackjack{
            self.winner = house
        }
    }
    func turn(_ player: Player) {
        while player.willHit(self.bet) {
            player.dealCard(self.deck.drawCard()!)
        }
    }
    func award(_ bet: UInt) {
        if let winner = winner {
            self.winner?.win(bet)
            if winner.name == player.name {
                self.house.lose(bet)
            } else {
                self.player.lose(bet)
            }
        }
    }
}
