//
//  House.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    init(){
        super.init(player: "House")
    }
    
    override func willHit(bet: UInt) -> Bool {
        if self.handValue < 17{
            return true
        }
        return false
    }
}
