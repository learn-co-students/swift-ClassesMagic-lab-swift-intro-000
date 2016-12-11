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
        super.init(name: "House")
        self.wallet = 124
        }
    
        
    override func willHit(_:(UInt))->Bool{
        var ans: Bool = false
        
        //print("UInt(self.handValue) \(UInt(self.handValue))")
        //print(17 > (UInt(self.handValue)))
        //return (2 > (UInt(self.handSize)))
        if UInt(self.handValue) < 17{
            ans = true
            return ans
        } else if (UInt(self.handValue) > 17){
            ans = false
        }
        return ans
}

}
