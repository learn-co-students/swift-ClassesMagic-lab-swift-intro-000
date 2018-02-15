//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var bet:UInt = 10
    var deck = Deck().cards
    
    var player:Player
    var house:House
    
    var winner:Player? {
        //let deal = Dealer()
        if player.isBlackjack {
            return player
        }
        else if house.isBlackjack {
            return house
            
        }
        else if player.handValue > house.handValue && player.handValue < 21 {
            return player
        }
        else if house.handValue > player.handValue && house.handValue < 21 {
            return house
        }
        return nil
    }
    
    init() {
        self.player = Player(name: "Player")
        self.house = House()
    }
    
    
    func deal() {
        //print("deck = \(deck)")
        for _ in 1...2 {
            player.dealCard(card: deck[0])
            house.dealCard(card: deck[0])
        }
        
        if player.isBlackjack {
            player = winner!
        } else if house.isBlackjack {
            house = winner! as! House
        }
    }
    func turn(player:Player) {
        if player.handValue < 21 {
            player.dealCard(card: deck[0])
        }
    }
    
    func award() {
        
        if (winner != nil) {
            winner?.win(amountWin: bet)
        } else {
            winner?.lose(amountLost: bet)
        }
        
        
        
    }
    
    /*
    func createDeck2() {
        let cardRanks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        let suits = [ "♠︎","♥︎","♦︎","♣︎"]
        //var deck:[Card] = []
        for suit in suits {
            for rank in cardRanks {
                let tempCard = Card(suit: suit, rank: rank)
                deck.append(tempCard)
            }
        }
    }
    */
}
