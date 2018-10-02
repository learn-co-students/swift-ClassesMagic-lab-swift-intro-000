//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    let name: String
    var wallet: UInt
    var hand: [Card]
    var handsize: Int {
        return hand.count
    }
    var handValue: UInt {
        var total = 0
        for card in hand {
            switch card.rank {
            case "A":
                if total + Int(card.value) + 10 > 21 {
                    let aceValue = 1
                    total += aceValue
                } else if total + Int(card.value) + 10 <= 21 {
                    let aceValue = 11
                    total += aceValue
                }
            default:
                total += Int(card.value)
            }
        }
        return UInt(total)
    }
    var isBlackJack: Bool {
        return handValue == 21
    }
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
        wallet = 100
        hand = []
    }
    
    func dealCard (card: Card) {
        hand.append(card)
    }
    
    func willHit(bet: UInt) -> Bool {
        return handValue < 21 && canPlaceBet(bet: bet)
    }
    
    func canPlaceBet (bet: UInt) -> Bool {
        return bet < wallet
    }
    
    func win(bet: UInt) {
        wallet += bet
    }
    
    func lose(bet: UInt) {
        wallet -= bet
    }
}
