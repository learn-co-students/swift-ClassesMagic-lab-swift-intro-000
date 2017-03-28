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
    let player: Player
    let house: House
    var bet: UInt = 0
    var winner: Player? {
        
        if ( player.isBlackjack ) {
            return player
        }
        
        if ( house.isBlackjack ) {
            return house
        }
        
        return nil
        
    }
    
    init() {
        deck = Deck()
        player = Player(name: "Player")
        house = House()
    }
    
    // Deals 2 cards to a given player (used in deal() to initalize their hands)
    func dealCard(_ player: Player) {
        
        var cardsDealt = 0
        
        while cardsDealt < 2 {
            if deck.drawCard() != nil {
                player.dealCard(deck.drawCard()!)
            }
            cardsDealt += 1
        }
        
    }
    
    func deal() {
        dealCard(player)
        dealCard(house)
    }
    
    func turn(_ player: Player) {
        
        var playerWillHit = player.willHit(bet)
        
        while playerWillHit == true {
            
            if let card = deck.drawCard() {
                player.dealCard(card)
            }
            
            // Check if the player will hit again
            playerWillHit = player.willHit(bet)
            
        }
        
    }
    
    func award() {
        
        // Award winner current bet
        winner?.win(bet)
        
        if winner is House { // House won, deduct from player (checked type of subclass)
            player.lose(bet)
        } else { // Player own, deduct from house
            house.lose(bet)
        }
        
    }
    
}
