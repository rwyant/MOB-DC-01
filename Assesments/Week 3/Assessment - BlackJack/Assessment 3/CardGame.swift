//
//  CardGame.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/23/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation
protocol BlackJack {
    // Require a deal method
    func deal () -> Int
    
    // Require a first hand method
    func firstHand () -> Int
}

class CardGame: BlackJack {
    
    func deal() -> Int {
        var randomNumber = arc4random_uniform(14) + 1
        if randomNumber > 11 {
            randomNumber = 10
        } else {
            
        }
        var card = Int(randomNumber)
        return card
    }
    
    func firstHand() -> Int {
        var firstCard = deal()
        var secondCard = deal()
        var hand = firstCard + secondCard
        return hand
    }
    func card() -> Int {
        var firstCard = deal()
        return firstCard
    }
    
    func dealerHand() -> Int {
        var firstCard = deal()
        var secondCard = deal()
        var dealerHandTotal = firstCard + secondCard
        while dealerHandTotal < 16 {
            dealerHandTotal += deal()
        }
        return dealerHandTotal
    }
    
    var player = Player(hand: 0)
    
}