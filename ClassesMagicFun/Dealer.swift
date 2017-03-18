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
    var currentBet: UInt
    
    init() {
        deck = Deck.init()
        player = Player.init(name: "Player")
        house = House.init()
        winner = nil
        currentBet = 0
    }
    
    func placeBet(_ bet: UInt) -> Bool {
        currentBet = bet
        return player.canPlaceBet(bet) && house.canPlaceBet(bet)
    }
    
    func getCard(_ player: Player) {
        var count: Int = 1
        while count <= 2 {
            if let card = deck.drawCard() {
                player.dealCard(card)
            }
            count += 1
        }
    }
    
    func deal() {
        getCard(player)
        getCard(house)
        
        if player.isBlackjack {
            winner = player
        } else if house.isBlackjack {
            winner = house
        }
    }
    
    func turn(_ player: Player) {
        getCard(player)
    }
    
    func award() {
        
    }
}
