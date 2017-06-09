//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
	var suit: String  // "♠️", "♣️", "♥️", "♦️"
	var rank: String // "A", "2", "3","4", "5", "6", "7", "8", "9", "10","J", "Q", "K"
	var label: String {
		return rank + suit
	}
	var value: UInt {
		if rank == "J" || rank == "Q" || rank == "K" {
			return 10
		}
		
		if "A" == rank {
			return 1
		}
		
		return UInt(rank)!
	}
	
	init(suit: String, rank: String) {
		self.suit = suit
		self.rank = rank
	}
}


