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
    var currentBet: UInt
    
    init(){
        
        self.deck = Deck()
        self.player = Player.init(name: "Player")
        self.house = House()
        self.currentBet = 0
    }
    
    func deal(){
        
        for _ in 0...2{
            let playerCard = deck.drawCard()
            let houseCard = deck.drawCard()
            guard let pCard = playerCard else{return}
            guard let hCard = houseCard else{return}
            player.hand.append(pCard)
            house.hand.append(hCard)
        }
        
        if player.handValue == 21 {
            winner = player
        }else if house.handValue == 21{
            winner = house
        }else{
            winner = nil
        }
    }
    
    func turn(player: Player){
        
        while !player.isBusted {
            let card = deck.drawCard()
            guard let playerCard = card else{return}
            player.dealCard(playerCard)
        }
    }
    
    func award(){
        
        winner?.win(currentBet)
    }
    
    func placeBet(bet: UInt)->Bool{
     
        if player.canPlaceBet(bet) && house.canPlaceBet(bet){
            currentBet = bet
            return true
        }
        return false
    }
    
}
