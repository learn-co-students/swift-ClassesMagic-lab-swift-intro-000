//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
	var name: String
	var wallet: UInt
	var hand: [Card]
	var handSize: Int {
		return hand.count
	}
	
	var handValue: UInt {
		var worth: UInt = 0
		var acesCount = 0
		
		for card in hand {
			if card.rank == "A" {
				acesCount += 1
			}
			if card.rank == "A" && acesCount == 1 {
				worth += 10
			}
		
			worth += card.value
		}
		
		return worth
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
	
	func dealCard(_ card: Card) {
		hand.append(card)
	}
	
	func canPlaceBet(_ bet: UInt) -> Bool {
		return bet < wallet
	}
	
	func willHit(_ bet: UInt) -> Bool {
		return handValue < 21 && canPlaceBet(bet)
	}
	
	func win(_ amount: UInt) {
		wallet += amount
	}
	
	func lose(_ amount: UInt) {
		wallet -= amount
	}
}
