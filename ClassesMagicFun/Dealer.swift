//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer:Deck {
    var bet:UInt = 0
    var totalCards = 0
    var deck = Deck().cards
    
    var player:Player
    var house:House
    
    
    override init() {
        self.player = Player(name: "Player")
        self.house = House()
    }
    
    var winner:Player? {
        print("player.handValue = \(player.handValue)  player.hand = \(player.hand)")
        print("house.handValue = \(house.handValue)  house.hand = \(house.hand)")
        
        if player.isBlackjack || house.isBusted {
            return player
        } else if house.isBlackjack || player.isBusted {
            return house
        }
        
        return nil
    }
    
    
    func deal() {
        //print("deck = \(deck)")
        for _ in 1...2 {
            player.dealCard(card: deck[0])
            deck.remove(at: 0)
            house.dealCard(card: deck[0])
            deck.remove(at: 0)
        }
        
        if player.isBlackjack {
            player = winner!
        } else if house.isBlackjack {
            house = winner! as! House
        }
    }
    func turn(player:Player) {
        if player.handValue < 21 && player.handSize < 5 {
            player.dealCard(card: deck[0])
            deck.remove(at: 0)
            //print("deck.count = \(deck.count)")
        }
    }
    
    func award() {
        
        if (winner != nil) {
            winner?.win(amountWin: bet)
        } else {
            winner?.lose(amountLost: bet)
        }
      
    }

}
