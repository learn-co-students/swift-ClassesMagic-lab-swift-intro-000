//
//  Player.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

class Player {
    
    var name : String;
    var wallet : UInt;
    var hand : [Card];
    var handSize : Int {
        return hand.count;
    }
    var numAces : Int;
    var handValue : UInt {
        var tempTotal = 0;
        var tempValue = 0;
        for card in hand {
            tempValue = card.value;
            if(tempValue == 1) {
                numAces += 1;
            }
            tempTotal += tempValue;
        }
        while(numAces > 0) {
            if((21 - tempTotal) >= 10) {
                tempTotal += 10;
                numAces -= 1;
            }
        }
        return UInt(tempTotal);
    }
    var isBlackJack : Bool;
    var isBusted : Bool;
    
    init(name: String) {
        self.name = name;
        wallet = 100;
        hand = [];
        numAces = 0;
        isBusted = false;
        isBlackJack = false;
    }
    
    func dealCard(_card : Card) {
        hand.append(_card);
    }
    
    func canPlaceBet(_bet : UInt) -> Bool {
        if(wallet > _bet) {
            return true;
        }
        return false;
    }
    
    func willHit(_bet : UInt) -> Bool {
        if(canPlaceBet(_bet: _bet) && handValue < 21) {
            return true;
        }
        return false;
    }
    
    func win(amountWon : UInt) {
        wallet += amountWon;
    }
    
    func lose(amountLost : UInt) {
        wallet -= amountLost;
    }
}
