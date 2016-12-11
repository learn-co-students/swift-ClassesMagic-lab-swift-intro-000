//: Playground - noun: a place where people can play

import UIKit

class Card{
    
    var suit:String
    var rank:String
    var label:String{
        get{
            return self.rank + "" + self.suit
        }
    }
    
    init(suit:String, rank:String){
        self.suit = suit
        self.rank = rank
    }
}

class Deck{
   

    var cards:[Card] = []
    let cardSuits: [String] = ["♥️","♦️","♣️","♠️"]
    let cardRanks: [String] = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    
    func createDeck()->[Card]{
    for(cardSuit) in cardSuits{
        for(cardRank) in cardRanks{
            let card = Card(suit:cardSuit, rank:cardRank)
            cards.append(card)
            }
        }
        return cards
    }
    
}


class Player {
    
    let hand:[Card] = []
    var handValue:UInt = 0
    var name: String
    var wallet: UInt = 0
    
    init(name:String){
        self.name = name
    }
    
}


var player = Player(name: "player")
player.wallet = 50
print(player.wallet)

class Dealer{
    
}


let deck = Deck()
let myDeck = deck.createDeck()

myDeck[0].rank





