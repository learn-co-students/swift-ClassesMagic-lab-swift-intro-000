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
    var currentBet: UInt
    var winner: Player? {
        
        //Player winning conditions:
            // Blackjack
            //Dealer busts
            //Nobody busted, Dealer's hand >= 17 && Player's hand == 21
        
        if player.isBlackjack || house.isBusted || (house.handValue >= 17 && player.handValue > house.handValue) {
            return player
            
        //Dealer winning conditions:
            //Player busts
            //Can't have a higher score than player since player will hit unless 21.
            
        } else if player.isBusted {
            return house
        } else {
            return nil
        }
    }
    
    init() {
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
        self.currentBet = 0
    }
    
    func deal() {
        for _ in 1...2 {
            player.dealCard(card: deck.drawCard()!)
            house.dealCard(card: deck.drawCard()!)
            }
//Maybe need to include blackjack code
        }
    func turn(player: Player) {
        while player.willHit(bet: currentBet) {
            player.dealCard(card: deck.drawCard()!)
        }
        
    }
    func award() {
        if let theWinner = winner?.name {
            if theWinner == "Player" {
                player.win(amount: currentBet)
                house.lose(amount: currentBet)
            } else {
                    player.lose(amount: currentBet)
                    house.lose(amount: currentBet)
                }
        }
    }
    
}
