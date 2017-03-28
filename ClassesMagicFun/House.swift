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
    
    override func willHit(_ currentBet: UInt) -> Bool {
        return ( handSize < 17 )
    }
    
}
