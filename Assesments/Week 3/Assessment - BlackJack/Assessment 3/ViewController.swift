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
    
    // BlackJack game: Create a a game of Blackjack
    // ************* Baseline requirements:
    // ** Set up Player class and CardGame class in their respective provided files. Follow the protocol rules for the CardGame class.
    // When card game first starts, a new player is generated and handed out 2 cards (between 1 and 11). Hint: generate 2 random numbers and add them together
    // A value for the CPU is also generated between 12 and 21 (random Int)
    // When the green view is double tapped (tap gesture recognizer), generate a new card (between 1 and 11) for the player, and add it to their score
    // If the total adds up to over 21, change the label text to "Game over, you lose!" and remove the ability for the player to keep tapping for cards
    // If the player wishes to not get dealt any more cards, the player can swipe right to end game (swipe gesture recognizer)
    // When the player ends the game, present the CPU score and present winner determined from compre comparison
    
    // Bonus: Create a button to play a new game.
    // Bonus 2: Player can start with a pool of money (selected through a text field) and make bets for each game (through a text field again). If player reaches <= 0, don't allow them to play any more games.
    // Bonus 3: When handing out cards, display the actual value to the user. If the card is an Ace, let the user select either 1 or 11.
    var playerHand = 0
    var wins = 0
    var losses = 0
    
    @IBAction func startGame(sender: UIButton) {
        var startGame = CardGame()
        
        startGame.player.name = "Rob"
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
        
        startGame.player.name = "Rob"
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

