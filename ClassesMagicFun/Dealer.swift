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
    var currentBet: UInt = 0
    var winner: Player? {
        get {
            return player
        } set {
            winner = newValue
        }
    }
    
    init() {
        deck = Deck()
        player = Player(name: "Player")
        house = House()
    }
    
    func placeBet(_ bet: UInt) {
        
    }
    
    func deal() {
        if deck.cards.count < 4 {
            return
        }
        
        player.dealCard(deck.drawCard()!)
        player.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        
        if player.handValue == 21 {
            winner = player
        } else if house.handValue == 21 {                                                                  
            winner = house
        }

    }
    
    func turn(_ player: Player) {
    }
    
    func award() {
        
    }
}
