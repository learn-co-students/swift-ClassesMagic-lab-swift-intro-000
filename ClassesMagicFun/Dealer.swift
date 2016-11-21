//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    let deck: Deck
    var player: Player
    let house: House
    var currentBet: UInt
    var playerTurns: UInt
    var winningPlayer: Player?
    var winner: Player? {
        // returns the winner of the game, being player or  house and nil if the game is still in progress
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
        deck = Deck()
        player = Player(name: "Player")
        house = House()
        currentBet = 0
        playerTurns = 0
        winningPlayer = nil
    }
    
    func deal() {
        // deals two card to each
        player.dealCard(dealtCard: deck.drawCard()!)
        player.dealCard(dealtCard: deck.drawCard()!)
        house.dealCard(dealtCard: deck.drawCard()!)
        house.dealCard(dealtCard: deck.drawCard()!)
        
        if player.isBlackJack {
            winningPlayer = player
        }
        
        if house.isBlackJack {
            winningPlayer = house
        }
    }
    
    func placeBet(bet: UInt) -> Bool {
        guard player.canPlaceBet(currentBet: bet) && house.canPlaceBet(currentBet: bet) else { return false }
        currentBet = bet
        return true
    }
    
    func turn(player: Player) {
        while player.willHit(currentBet: currentBet) && player.handSize <= 5 {
            player.dealCard(dealtCard: deck.drawCard()!)
        }
        
        playerTurns += 1
    }
    
    func award() {
        guard winner != nil else { return }
        winner!.win(amountWon: currentBet)
        
        if let _ = winner as? House {
            player.lose(amountLost: currentBet)
        } else {
            house.lose(amountLost: currentBet)
        }
    }
}
