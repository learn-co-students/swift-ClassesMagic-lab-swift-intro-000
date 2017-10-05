//
//  Card.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit : String;
    var rank : String;
    var label : String {
        get {
            return rank + suit;
        }
    }
    var value : Int {
        get {
            if(rank == "A") {
                return 1;
            } else if(rank == "K" || rank == "Q" || rank == "J") {
                return 10;
            } else {
                return Int(rank)!;
            }
        }
    }
    
    init(suit : String, rank : String) {
        self.suit = suit;
        self.rank = rank;
    }
  
}


