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
    var winner: Player? {
        if player.handValue == 21{
            return player
        } else {
            return nil
        }
    }
    
    init() {
        self.deck = Deck()
        self.player = Player(player: "Player")
        self.house = House() 
    }
    
    func deal() {
        drawCard(for: player)
        drawCard(for: player)
        drawCard(for: house)
        drawCard(for: house)
        if winner != nil {
            award()
        }
    }
    
    func drawCard(for player: Player) {
        guard let card = deck.drawCard() else {
            return
        }
        
        player.dealCard(card: card)
    }
    
    func turn(player: Player) {
        if player.willHit(bet: 100) {
           player.dealCard(card: deck.drawCard()!)
        }
    }
    
    func award() {
        if player.handValue == 21 {
            player.win(the: 100)
            house.lose(the: 100)
        } else if house.handValue == 21 {
            player.lose(the: 100)
            house.win(the: 100)
        }
    }
    
}
