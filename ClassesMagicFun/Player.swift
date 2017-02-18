//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    let name: String
    var wallet: UInt = 0
    var hand: [Card] = []
    var handSize: Int {
        return hand.count
    }
    
    var handValue: UInt {
        var bestHandValue: UInt = 0
        var aceIsOne: UInt = 0
        var numberOfAces: UInt = 0
        
        for card in hand {
            if card.rank == "A" {
                numberOfAces += 1
            }
        }
        // calculate hand value counting each Ace as one.
            for card in hand {
                aceIsOne += card.value
            }

            
        //for loop to add up each ace as eleven to get the highest value without busting.
            for worthEleven in 0...numberOfAces {

                bestHandValue = aceIsOne + (worthEleven * 10)
                if bestHandValue > 10 {
                    break
                }
            }
        return bestHandValue
        }
    var isBlackjack: Bool {
        if handSize == 2 && handValue == 21 {
            return true
        } else {
            return false
        }
    }
    
    var isBusted: Bool {
        if handValue > 21 {
            return true
        } else {
            return false
        }
    }
    
    init(name: String) {
        self.name = name

    }
    func dealCard(card: Card) {
        hand.append(card)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        if bet < wallet {
            return true
        } else {
            return false
        }
    }
    
    func willHit(bet: UInt) -> Bool {
        if bet < wallet && handSize < 21 {
            return true
        } else {
            return false
        }
    }
    
    func win(amount: UInt) {
        wallet += amount
    }
    
    func lose(amount: UInt) {
        wallet -= amount
    }

}
