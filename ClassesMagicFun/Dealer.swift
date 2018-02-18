//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer:Deck {
    var bet:UInt = 50
    var amountWin:UInt = 0
    var totalCards = 0
    var deck = Deck().cards
    var player:Player
    var house:House
    
    
    override init() {
        self.player = Player(name: "Player")
        self.house = House()
    }
    
    var winner:Player? {
        print("player.handValue = \(player.handValue)  player.handSize = \(player.handSize )")
        print("house.handValue = \(house.handValue)  house.handSize = \(house.handSize)")
        
        if player.isBlackjack || house.isBusted {
            return player
        } else if house.isBlackjack || player.isBusted {
            return house
        } else if player.handSize == 5 && (house.handSize == 5 || house.handValue > 17) {
            if player.handValue > house.handValue {
                return player
            } else {
                return house
            }
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
            if player.canPlaceBet(bet: bet) {
                if player.willHit(bet: bet) {
                    player.dealCard(card: deck[0])
                    deck.remove(at: 0)
                }
            }
        }
    }
    
    func award() -> UInt {
        if (winner != nil) {
            let winnings = player.win(amount: amountWin)
            //print("winnings = \(winnings)")
            return winnings
        }
        return player.lose(amountLost: amountWin)
    }

}
