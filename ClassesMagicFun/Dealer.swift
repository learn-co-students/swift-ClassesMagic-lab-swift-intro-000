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
        if player.wallet > house.wallet {
            return player
        }
        if house.wallet > player.wallet {
            return house
        }
        else {
            return nil
        }
    }
    
    init() {
        self.player = Player.init(name: "Player")
        self.house = House.init()
        self.deck = Deck.init()
    }
    
    func deal() {
        var x = 0
        while x < 2 {
            self.player.dealCard(deck.drawCard()!)
            x += 1
        }
    }
    
    func turn(_ player: String) {
        if self.player.willHit(bet: 10) {
            deal()
        }
    }
    
    func award() {
        if player.isBusted {
            player.lose(10)
            house.win(10)
        }
        else if house.isBusted {
            player.win(10)
            house.lose(10)
        }
        else if player.handValue > house.handValue {
            player.win(10)
            house.lose(10)
        }
        else if house.handValue > player.handValue {
            house.win(10)
            player.lose(10)
        }
//        else {
//            nil
//        }
        
    }
    
    
    
    
}
