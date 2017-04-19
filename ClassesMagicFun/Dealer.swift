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
    
    var winner: Player? {
        get {
            if player.handValue == 21 {
                return player
            }
            else if house.handValue == 21 {
                return house
            }
            else if house.handValue > 21 && player.handValue < 21 {
                return player
            }
            else if player.handValue > 21 && house.handValue < 21 {
                return house
            }
            else {
                return nil
            }
        }
    }
    
    init() {
        player = Player(name: "Player")
        house = House()
        deck = Deck()
    }
    
    func deal() {
        player.hand.append(deck.drawCard()!)
        player.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
        
    }
    
    func turn(_ player: Player) {
        player.hand.append(deck.drawCard()!)
        player.hand.append(deck.drawCard()!)
        while player.willHit(5) {
            player.hand.append(deck.drawCard()!)
        }
    }
    
    func award(_ currentBet: UInt) {
        if let winner = self.winner {
            winner.wallet += currentBet
        }
    }
}
