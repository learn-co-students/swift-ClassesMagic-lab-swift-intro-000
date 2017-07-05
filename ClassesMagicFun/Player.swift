//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

//A String property called name that will store the name of the player.
//A UInt property called wallet that will store how much money the player has.
//A [Card] property called hand that will store the player's hand.
//An Int property called handSize that will store the number of cards in the player's hand.
//A UInt property called handValue that will store the value of the player's hand. In Blackjack, numbered cards are worth the numerical value of the card, face cards are worth 10 points, and aces can be worth 1 or 11 at the player's discretion. Aces are a bit tricky, so you will have to implement some logic to decide if the ace should be worth 1 or 11. (If it makes your implementation simpler, you can assume the player will hold no more than one ace at a time, although this is not guaranteed.)
//A Bool property called isBlackjack that determines if the player's hand value is 21.
//A Bool property called isBusted if the player's hand value is over 21.
//An initializer that takes a single parameter, the name of the player. It should assign this value to the name property.
//A method called dealCard(_:). This method takes one card as a parameter and adds it to the player's hand.


class Player {
    var name: String
    var wallet: UInt
    
    var hand: [Card]
    
    var handSize: Int {
        return hand.count
    }
    
    var handValue: UInt {
        // There's a bit of a hitch here: Aces can be worth 1 or 11.
        // Here, we add up the score with aces worth both 1 and 11. If
        // making aces worth 11 is still 21 or less, we return that value;
        // otherwise, we return the value with aces being 1.
        // This doesn't handle cases in which a player may have 2 or more
        // aces and want to treat one as 1 and the other as 11, but for
        // this lab we won't worry about that.
        
        let ace1 = hand.reduce(0) { (sum, card) in
            return sum + Int(card.value)
        }
        
        let ace2 = hand.reduce(0) { (sum, card) in
            let value = card.rank == "A" ? 11 : card.value
            return sum + Int(value)
        }
        
        if ace2 <= 21 {
            return UInt(ace2)
        }
        else {
            return UInt(ace1)
        }
    }
    
    var isBlackjack: Bool {
        return handValue == 21
    }
    
    var isBusted: Bool {
        return handValue > 21
    }
    
    init(name: String) {
        self.name = name
        self.wallet = 100
        self.hand = []
    }
    
    func dealCard(card: Card) {
        return hand.append(card)
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return bet <= wallet
    }
    
    func willHit(bet: UInt) -> Bool {
        return handValue < 21 && canPlaceBet(bet: bet)
    }
    
    func win(amountWon: UInt) {
        wallet += amountWon
    }
    
    func lose(amountLost: UInt) {
        wallet -= amountLost
    }

}
