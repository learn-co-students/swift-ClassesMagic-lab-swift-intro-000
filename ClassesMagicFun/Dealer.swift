//
//  Dealer.swift
//  ClassesMagicFun
//  Copyright © 2016 Flatiron School. All rights reserved.

//  DataComm Network Solutions

import Foundation

class Dealer {
    
    var deck: Deck
    var player: Player
    var house: House
    var currentBet: UInt
    var playerTurns: UInt
    
    init() {
        deck = Deck()
        player = Player(name:"Player")
        house = House()
        currentBet = 0
        playerTurns = 0
    }
    
    var winner:(Player?){
        if(house.hand.count < 2){
            return nil
        } else if(player.handValue > house.handValue && !player.isBusted){
                return player
        } else if (player.handValue < house.handValue && !house.isBusted) {
            return house
        }
        else{
            return nil
        }
    }
    
    func deal(){
        while (house.hand.count < 2){
            player.dealCard(deck.drawCard()!)
            house.dealCard(deck.drawCard()!)
            }
    }
    
  
    func placeBet(bet:UInt)->Bool?{
        //added from BJ2 lab

        currentBet += bet
        guard player.canPlaceBet(bet) && house.canPlaceBet(bet) else { return false }
        return true
        /*
    switch true {
        case player.wallet > bet && house.wallet > bet:
            return true
        case player.wallet < bet || house.wallet < bet:
            return false
        case player.wallet == bet && house.wallet == bet:
            return true

        default:
            return false
        } */
    }

    
    func turn(currentPlayer:Player){
        //while loop added from BJ2 lab
    while currentPlayer.willHit(currentBet) && currentPlayer.handSize <= 5{
        currentPlayer.dealCard(deck.drawCard()!)
        }
        playerTurns += 1
    }
    
    func award(){
        // mine: winner?.wallet += currentBet
        //this added from BJ2
        guard winner != nil else { return }
        winner!.win(currentBet)
        if let _ = winner as? House {
            player.lose(currentBet)
        } else {
            house.lose(currentBet)
        }
    }
}









