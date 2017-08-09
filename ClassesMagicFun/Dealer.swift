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
        self.player = Player(name: "Player")
        self.house = House()
        self.deck = Deck()
        self.winner = nil
    }
    
    func deal() {
        deck.shuffle()
        player.hand[0] = deck.cards.remove(at: 0)
        house.hand[0] = deck.cards.remove(at: 0)
        player.hand[1] = deck.cards.remove(at: 0)
        house.hand[1] = deck.cards.remove(at: 0)
        if player.handValue == 21 {self.winner = player}
        if house.handValue == 21 {self.winner = house}
    }
    
    func turn(_ player: Player) {
        var playerCardIndex = 2
        while player.handValue < 21 {
            player.hand[playerCardIndex] = deck.cards.remove(at: 0)
            playerCardIndex += 1
        }
    }
    
    func award(_ player: self.winner) {
        if let currentWinner == player {
            player.wallet -= 
    }
}
