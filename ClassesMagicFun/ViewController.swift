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

        let dealer = Dealer()
        //print("dealer = \(dealer)")
        var turn = "player"
        dealer.deal()
        if let _ = dealer.winner {
            dealer.award()
        }
        while dealer.winner == nil {
            count+=1
            let player = (turn == "player" ? dealer.house : dealer.player)
            dealer.turn(player: player)
            turn = (turn == "player" ? "house" : "player")
            
            print("count = \(count)")
            print("turn = \(turn)")
        }
        dealer.award()
        print("Winner: \(String(describing: dealer.winner?.name))")
    }

}
