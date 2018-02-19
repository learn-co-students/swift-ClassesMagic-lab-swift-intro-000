//
//  ViewController.swift
//  ClassesMagicFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loser = Player(name: "")
        let dealer = Dealer()
        var turn = "player"
        dealer.deal()
        if let _ = dealer.winner {
            let totalWinning = dealer.award()
            print("\nWinner is: \(dealer.winner!.name), winnings = \(totalWinning)")
        }
        while dealer.winner == nil {
            
            count+=1
            print("count = \(count)")
            let player = (turn == "player" ? dealer.house : dealer.player)
            dealer.turn(player: player)
            turn = (turn == "player" ? "house" : "player")
            
            
            //print("turn = \(turn)")
            //print("dealer.winner = \(String(describing: dealer.winner))")
            
        }
        
        if dealer.winner?.name == "Player" {
            loser = dealer.house
        } else {
            loser = dealer.player
        }
        
        let totalWinning = dealer.award() + (dealer.winner?.wallet)!
        print("\nWinner is: \(dealer.winner!.name), wallet+profit = \(totalWinning),\nwallet $$ = \((dealer.winner?.wallet)!), profit $$ = \(dealer.award())")
        
        print("\nLoser is: \(loser.name)")
    }

}
