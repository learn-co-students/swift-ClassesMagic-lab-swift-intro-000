//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck:Deck
    var player:Player
    var house:House
    var winner:Player?
    
    init() {
        deck = Deck()
        player = Player(name: "Sue")
        house = House()
        self.playDeck()
    }
    
    func playDeck() {
        while !deck.isFullyDealt() {
            playHand()
        }
        winner = determineWinner()
        print("The winner is \(winner!.name)")
    }
    
    func playHand() {
        if !deck.isFullyDealt() {
        player.dealCard(card: deck.drawCard()!)
        }
          if !deck.isFullyDealt() {
        player.dealCard(card: deck.drawCard()!)
        }
          if !deck.isFullyDealt() {
        house.dealCard(card: deck.drawCard()!)
        }
          if !deck.isFullyDealt() {
        house.dealCard(card: deck.drawCard()!)
        }
        if !house.didWin() {
            let randomNum = UInt(arc4random_uniform(UInt32(player.wallet)))
            while player.willHit(randomNum) {
                  if !deck.isFullyDealt() {
                    self.player.dealCard(card: deck.drawCard()!)
                }
                if self.player.didWin() {
                    self.player.win(amountWon: randomNum)
                } else if self.player.didLose() {
                    self.player.lose(amountLost: randomNum)
                }
            }
        } else {
            house.win(amountWon: 10)
        }
    }
    
    func determineWinner() -> Player {
        if house.wallet > player.wallet {
            return house
        } else {
            return player
        }
    }
}
