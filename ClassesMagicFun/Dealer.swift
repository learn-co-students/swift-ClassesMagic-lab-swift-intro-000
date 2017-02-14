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
    var playerTurns: UInt
    var winningPlayer: Player?
    
    var winner: Player? {
        
        if let _ = winningPlayer {
            return winningPlayer
        }
        
        if playerTurns < 2 {
            return nil
        }
        
        if player.isBusted {
            return house
        }
        
        if house.isBusted {
            return player
        }
        
        if player.handValue > house.handValue {
            return player
        } else {
            return house
        }
    }
    
    init() {
        
        self.deck = Deck()
        self.player = Player(name: "Player")
        self.house = House()
        self.currentBet = 0
        self.playerTurns = 0
        self.winningPlayer = nil
    }
    
    func deal() {
        player.dealCard(deck.drawCard()!)
        player.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        house.dealCard(deck.drawCard()!)
        
        if player.isBlackjack {
            winningPlayer = player
        }
        
        if house.isBlackjack {
            winningPlayer = house
        }
    }
    
    func turn(player: Player) {
        while player.willHit(currentBet) && player.handSize <= 5 {
            player.dealCard(deck.drawCard()!)
        }
        playerTurns += 1
    }
    
    
    
    func placeBet(bet: UInt) -> Bool {
        guard player.canPlaceBet(bet) && house.canPlaceBet(bet) else { return false }
        currentBet = bet
        return true
    }
    
    func award() {
        guard winner != nil else { return }
        winner!.win(currentBet)
        if let _ = winner as? House {
            player.lose(currentBet)
        } else {
            house.lose(currentBet)
        }
    }
}
