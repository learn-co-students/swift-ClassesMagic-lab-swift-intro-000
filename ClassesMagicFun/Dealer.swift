//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer{
    var deck : Deck
    var player : Player
    var house : House
    var winner : Player?
    
    init(){
        self.deck = deck
        self.player = player
        self.house = house
    }
    
    func deal(){
        self.player.dealCard()
        self.player.dealCard()
        self.house.dealCard()
        self.house.dealCard()
        self.winner = player
    }
    
    func turn(_ player: Player){
        self.player.deal()
    }
    
    func award(_ player: Player){
        self.player.deal()
    }
    
}
