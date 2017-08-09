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
    
    override func willHit(_ bet: UInt) -> Bool {
        var hitMe = false
        if self.handValue < 17 {hitMe = true}
        return hitMe
    }
}
