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
    var winner: Player?
    var currentBet: UInt = 0
    
    init( ) {
        self.deck = Deck( )
        self.player = Player(name: "Player")
        self.house = House( )
    }
    
    func deal( ){
        for _ in 1...2{
            player.dealCard(deck.drawCard()!)
            house.dealCard(deck.drawCard()!)
        }
        
        if(player.handValue == 21){
            self.winner = player
        }
        else if(house.handValue == 21){
            self.winner = house
        }
    }
    
    func turn(_ player: Player){
        while player.willHit(self.currentBet){
            player.dealCard(deck.drawCard()!)
        }
        
    }
    
    func award( ){
        if self.winner == nil {
            return
        }
        if self.winner!.name == self.player.name{
            player.win(self.currentBet)
            house.lose(self.currentBet)
        }
        else{
            house.win(self.currentBet)
            player.lose(self.currentBet)
        }
    
    }
}
