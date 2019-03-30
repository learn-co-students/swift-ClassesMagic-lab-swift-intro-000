//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer
{
    var deck: Deck
    var player: Player
    var house: House
    var winner: Player?
    
    init()
    {
        //self.deck
        self.player = Player (name: "Player")
        self.house = House()
        self.deck = Deck()
    }
    
    func deal()
    {
        if let firstDraw = deck.drawCard()
        {
            player.hand.append(firstDraw)
        }
        if let secondDraw = deck.drawCard()
        {
            player.hand.append(secondDraw)
        }
        
        if let firstDraw = deck.drawCard()
        {
            house.hand.append(firstDraw)
        }
        if let secondDraw = deck.drawCard()
        {
            house.hand.append(secondDraw)
        }
        
        if (player.handValue == 21)
        {
            winner = player
        }
        if (house.handValue == 21)
        {
            winner = house
        }
    }
    
    func turn (player: Player)
    {
        
    }
    
    func award ()
    {
        if winner?.name == "Player"
        {
            player.win(winAmount: player.wallet )
            house.lose(loseAmount: house.wallet)
        }
        if winner?.name == "House"
        {
            player.win(winAmount: player.wallet )
            house.lose(loseAmount: house.wallet)
        }
    }
}
