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
    var winner: Player? = nil
    
    var bet: UInt = 0
    
    init() {
        deck = Deck()
        player = Player(name: "Player")
        house = House()
    }
    
    func deal() {
        player.dealCard(deck.drawCard()!)
        player.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        
        if player.isBlackjack {
            winner = player
        } else if house.isBlackjack {
            winner = house
        }
    }
    
    func turn(_ player: Player) {
        var willHit: Bool = player.willHit(bet)
        while willHit {
            player.dealCard(deck.drawCard()!)
            willHit = player.willHit(bet)
        }
    }
    
    func award() {
        winner?.win(bet)
        if winner is House {
            player.lose(bet)
        } else {
            house.lose(bet)
        }
    }
}
