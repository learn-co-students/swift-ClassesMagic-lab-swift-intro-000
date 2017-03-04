//
//  ViewController.swift
//  ClassesMagicFun
//  Copyright © 2016 Flatiron School. All rights reserved.

//  DataComm Network Solutions

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var winningHandValue: UILabel!
    
    @IBOutlet weak var cardLabel0: UILabel!
    
    @IBOutlet weak var cardLabel1: UILabel!
    
    @IBOutlet weak var cardLabel2: UILabel!
    
    @IBOutlet weak var cardLabel3: UILabel!
    

    let dealer = Dealer()
    func playGame() -> Player{
        var turn = "player"
        dealer.deal()
        if let _ = dealer.winner {
            dealer.award()
        }
        while dealer.winner == nil {
            let player = turn == "player" ? dealer.house : dealer.player
            dealer.turn(player)
            turn = turn == "player" ? "house" : "player"
        }
        dealer.award()
        //print("Winner: \(dealer.winner!.name)")
        return dealer.winner!
        
    }
    func playgamePressed(_ :Dealer){
        _ = Dealer()
        let thisWINNER = playGame()
        winnerLabel.text = thisWINNER.name
        winningHandValue.text = String(thisWINNER.handValue)
        cardLabel0.text =  thisWINNER.hand[0].label
        cardLabel1.text = thisWINNER.hand[1].label
        
        cardLabel2.text = dealer.house.hand[0].label
        cardLabel3.text = dealer.house.hand[1].label
    }
    @IBAction func playButtonPressed(sender: UIButton) {
        
        playgamePressed(dealer)
    }
    
    
}



