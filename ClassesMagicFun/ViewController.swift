//
//  ViewController.swift
//  ClassesMagicFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let dealer = Dealer()
        var turn = "player"
        dealer.deal()
        if let _ = dealer.winner {
            dealer.award(10)
        }
        while dealer.winner == nil {
            let player = turn == "player" ? dealer.house : dealer.player
            dealer.turn(player)
            turn = turn == "player" ? "house" : "player"
        }
        dealer.award(10)
        print("Winner: \(dealer.winner?.name)")
    }

}
