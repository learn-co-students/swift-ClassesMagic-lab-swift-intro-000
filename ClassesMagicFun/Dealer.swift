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
    var house: House
    var currentBet: UInt
    var winningPlayer: Player?
    var winner: Player? {
        if player.handValue < 21 && player.handValue > house.handValue && player.hand.count <= 5 || house.isBusted {
            return player
        } else if house.handValue <= 21 && house.handValue > player.handValue || player.isBusted {
            return house
        } else {
            return nil
        }
    }
    
    init(currentBet: UInt) {
        deck = Deck()
        player = Player(name: "player")
        house = House()
        winningPlayer = nil
        self.currentBet = currentBet
    }
    
    func deal(){
        guard let newCard = deck.drawCard() else {
            return
        }
        player.dealCard(card: newCard)
        player.dealCard(card: newCard)
        house.dealCard(card: newCard)
        house.dealCard(card: newCard)
        
        if player.isBlackJack  {
            winningPlayer = player
        }
        
        if house.isBlackJack {
            winningPlayer = house
        }
    }
    
    func turn(player: Player) {
        while player.willHit(bet: self.currentBet) && player.canPlaceBet(bet: self.currentBet) {
            if let newCard = deck.drawCard() {
                player.dealCard(card: newCard)
                return
        }
        }
        while house.willHit(bet: self.currentBet) && house.canPlaceBet(bet: currentBet) {
            if let newCard = deck.drawCard() {
                    house.dealCard(card: newCard)
                return
            }
        }
    }
    
    func award() {
        if var winnerOfThisRound = winningPlayer?.name {
            if winnerOfThisRound == "player" {
                player.win(bet: self.currentBet)
                house.lose(bet: self.currentBet)
            } else {
                player.lose(bet: self.currentBet)
                house.win(bet: self.currentBet)
            }
            return
        }
    }
}
