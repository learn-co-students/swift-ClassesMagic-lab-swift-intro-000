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
    let player: Player
    let house: House
    var currentBet: UInt
    var numberOfTurns: UInt
    var winningPlayer: Player?
    var winner: Player? {
        if let wp = winningPlayer {
            return wp
        }
        
        if numberOfTurns < 2 {
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
        self.numberOfTurns = 0
        self.winningPlayer = nil
    }
    
    func deal() {
        var card1 = deck.drawCard()
        var card2 = deck.drawCard()
        var card3 = deck.drawCard()
        var card4 = deck.drawCard()
        
        player.dealCard(card: card1!)
        house.dealCard(card: card2!)
        player.dealCard(card: card3!)
        house.dealCard(card: card4!)
        
        if player.isBlackjack && !house.isBlackjack {
            winningPlayer = player
        } else if house.isBlackjack && !player.isBlackjack {
            winningPlayer = house
        }
    }
    
    func turn(player: Player) {
        while player.willHit(currentBet: currentBet) {
            let card = deck.drawCard()!
            player.dealCard(card: card)
            numberOfTurns += 1
        }
    }
    
    func award() {
        if winner == nil { return }
        winner!.win(amountWon: currentBet)
        if let _ = winner as? House {
            player.lose(amountLost: currentBet)
        } else {
            house.lose(amountLost: currentBet)
        }
    }
        
}
