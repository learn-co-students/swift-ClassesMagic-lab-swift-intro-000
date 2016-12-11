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
    
    init() {
        deck = Deck()
        player = Player(name:"Player")
        house = House()
    }
    
    var winner:(Player?){
        if(deck.cards.isEmpty){
            return nil
        } else if(player.handValue > house.handValue){
                return player
        } else if (player.handValue < house.handValue) {
            return house
        }
        else{
            return nil
        }
    }
    
    //var card = Card(suit: "♥️", rank: "10") test card instance for good measure
    
    func deal(){
        guard house.hand.count < 2 else { return }
        player.hand.append(deck.drawCard()!)
        house.hand.append(deck.drawCard()!)
    }
    
    func currentBet(thisBet:UInt) ->UInt {
        return thisBet
    }
    
    func placeBet(bet:UInt)->Bool?{
    switch true {
        case player.wallet > bet && house.wallet > bet:
            return true
        case player.wallet < bet || house.wallet < bet:
            return false
        case player.wallet == bet && house.wallet == bet:
            return true

        default:
            return false
        }
    }

    func twoCompare(){
        
        //print("house wallet \(house.wallet) player.wallet\(player.wallet)")
        //print("bet to place:\(placeBet(59))")
    }
    
    func turn(currentPlayer:Player){
    if(!currentPlayer.isBusted){
        currentPlayer.dealCard(deck.drawCard()!)
        }
    }
    
    func award(lostAmount:UInt){
        winner?.wallet = (winner?.wallet)! + lostAmount
    }
}
