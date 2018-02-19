//
//  House.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    init() {
        super.init(name: "House")
    }
    
    override func willHit(bet:UInt) -> Bool {
        
        if bet <= wallet && handValue < 17 {
            wallet-=bet
            amountWin+=bet
            print("wallet after Hit = \(wallet)")
            print("Current amountWin pot = \(amountWin)")
            return true
        }
        return false
    }
    
}
