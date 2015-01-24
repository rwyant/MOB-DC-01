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
        let randomNumber = arc4random_uniform(11) + 1
        var card = Int(randomNumber)
        return card
    }
    
    func firstHand() -> Int {
        var firstCard = deal()
        var secondCard = deal()
        var hand = firstCard + secondCard
        return hand
    }
    
    func dealerHand() -> Int {
        let randomNumber = arc4random_uniform(10) + 12
        var dealerHandTotal = Int(randomNumber)
        return dealerHandTotal
    }
    
    var player = Player(hand: 0)
    
}