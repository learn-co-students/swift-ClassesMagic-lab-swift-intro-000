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
	var whoIsAhead: Player?
	var playerTurns: UInt
	var currentBet: UInt
	var winner: Player?
	
	init() {
		self.deck = Deck()
		player = Player(name: "Player")
		house = House()
		whoIsAhead = nil
		currentBet = 0
		playerTurns = 0
	}
	
	func deal() {
		player.dealCard(deck.drawCard()!)
		player.dealCard(deck.drawCard()!)
		house.dealCard(deck.drawCard()!)
		house.dealCard(deck.drawCard()!)
		
		if player.isBlackjack {
			winner = player
		}
		
		if house.isBlackjack {
			winner = house
		}
	}
	
	func placeBet(_ bet: UInt) -> Bool {
		guard player.canPlaceBet(bet) && house.canPlaceBet(bet) else { return false }
		currentBet = bet
		return true
	}
	
	func turn(_ player: Player) {
		while player.willHit(currentBet) && player.handSize <= 5 {
			player.dealCard(deck.drawCard()!)
		}
		playerTurns += 1
	}
	
	func award() {
		if winner?.name == "Player" {
			player.lose(currentBet)
		} else {
			house.lose(currentBet)
		}
	}
}
