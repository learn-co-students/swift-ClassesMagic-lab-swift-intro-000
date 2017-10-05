//
//  Dealer.swift
//  ClassesMagicFun
//
//  Created by Michael Dippery on 7/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    
    var deck : Deck;
    var player : Player;
    var house : House;
    var winner : Player?;
    var bet : UInt;
    
    init() {
        deck = Deck();
        player = Player(name: "Player");
        house = House();
        bet = 10;
    }
    
    func deal() {
        if(deck.hasCards) {
            player.dealCard(_card: deck.drawCard()!)
        }
        if(deck.hasCards) {
            house.dealCard(_card: deck.drawCard()!)
        }
        if(deck.hasCards) {
            player.dealCard(_card: deck.drawCard()!)
        }
        if(deck.hasCards) {
            house.dealCard(_card: deck.drawCard()!)
        }
        if(player.isBlackJack) {
            winner = player;
        } else if(house.isBlackJack) {
            winner = house;
        }
    }
    
    func turn(_player: Player) {
        while(deck.hasCards) {
            if(_player.willHit(_bet: bet)) {
            _player.dealCard(_card: deck.drawCard()!)
                if(_player.isBlackJack || _player.isBlackJack) {
                    break;
                } else {
                    break;
                }
            }
        }
    }
    
    func award() {
        if(house.isBlackJack) {
            house.win(amountWon: bet);
            player.lose(amountLost: bet);
        } else if(player.isBlackJack) {
            player.win(amountWon: bet);
            house.lose(amountLost: bet);
        } else if(player.isBusted) {
            house.win(amountWon: bet);
            player.lose(amountLost: bet);
        } else if(house.isBusted) {
            player.win(amountWon: bet);
            house.lose(amountLost: bet);
        } else if(player.handValue > house.handValue) {
            player.win(amountWon: bet);
            house.lose(amountLost: bet);
        } else {
            house.win(amountWon: bet);
            player.lose(amountLost: bet);
        }
    }
}
