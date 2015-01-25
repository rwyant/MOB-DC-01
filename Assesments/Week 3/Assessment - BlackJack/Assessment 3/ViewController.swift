//
//  ViewController.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/22/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var textView3: UITextView!
    @IBOutlet weak var textView4: UITextView!
    
    var playerHand = 0
    var wins = 0
    var losses = 0

    
    @IBAction func startGame(sender: UIButton) {
        var startGame = CardGame()
        
        playerHand = startGame.firstHand()
        if playerHand == 22 {
            textView.text = "Please hit 'Start Game'"
            textView3.text = ""
        } else {
        var text = "WELCOME TO BLACKJACK! \nYou're starting with a hand of '\(String(playerHand))'."
        textView.text = text
        textView3.text = "Do you want to HIT or STAY? (use green pad)"
        textView2.text = ""
        println("New game")
            println("\(IntroViewController().wallet)")
        }
        
    }
    
  
   
    @IBAction func doubleTap(sender: UITapGestureRecognizer) {
        var startGame = CardGame()
        
        var dealerHand = startGame.dealerHand()
        playerHand += startGame.deal()
        
        if playerHand > 21 {
            var text = "Your new hand is \(String(playerHand))."
            losses += 1
            textView.text = "WELCOME TO BLACKJACK!"
            textView2.text = "SORRY, YOU BUSTED."
            textView3.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            println("Player lost")
        } else {
            var text = "Your new hand is \(String(playerHand))."
            textView.text = "WELCOME TO BLACKJACK!"
            textView3.text = text
        }
    }
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        var startGame = CardGame()
        
        var dealerHand = startGame.dealerHand()
        if dealerHand > playerHand {
            var text = "The computer has a hand of \(String(dealerHand)). \n\nSORRY, YOU LOSE."
            losses += 1
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            println("Player lost")
        } else if dealerHand == playerHand {
            var text = "The computer has a hand of \(String(dealerHand)). \n\nSORRY, YOU PUSHED."
            println("Push")
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
        } else {
            var text = "The computer has a hand of \(String(dealerHand)). \n\nYOU WIN!"
            wins += 1
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            println("Player won")
        }
    }
    
    @IBAction func playAgain(sender: UIButton) {
        var startGame = CardGame()
        
        playerHand = startGame.firstHand()
        if playerHand == 22 {
            textView.text = "Please hit 'Start Game'"
            textView3.text = ""
        } else {
        var text = "WELCOME TO BLACKJACK! \nYou're starting with a hand of '\(String(playerHand))'.\nDo you want to HIT or STAY? (use green pad)"
        textView.text = text
        textView2.text = ""
        textView3.text = "Do you want to HIT or STAY?"
        textView4.text = ""
        println("New game")
        }
    }
    
    
    @IBOutlet weak var redBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


}

