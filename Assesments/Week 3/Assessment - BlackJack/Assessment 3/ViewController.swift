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

    @IBOutlet weak var hiddenBox: UIView!
    @IBOutlet weak var winnerBox: UIImageView!
    @IBOutlet weak var loserBox: UIImageView!
    @IBOutlet weak var pushBox: UIImageView!
    
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
        hiddenBox.alpha = 0
        loserBox.alpha = 0
        winnerBox.alpha = 0
        pushBox.alpha = 0
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
            UIView.animateWithDuration(0, animations:{ self.loserBox.alpha = 1
                self.hiddenBox.alpha = 1
            })
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
        if dealerHand > 21 {
            var text = "The dealer busts with a \(dealerHand).\n\nYOU WIN!"
            wins += 1
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            UIView.animateWithDuration(0, animations:{ self.winnerBox.alpha = 1
                self.hiddenBox.alpha = 1
            })
            println("Player won")
        } else if dealerHand > playerHand {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nSORRY, YOU LOSE."
            losses += 1
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            UIView.animateWithDuration(0, animations:{ self.loserBox.alpha = 1
                self.hiddenBox.alpha = 1
            })
            println("Player lost")
        } else if dealerHand == playerHand {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nLET'S TRY THAT AGAIN, YOU PUSHED."
            UIView.animateWithDuration(0, animations:{ self.pushBox.alpha = 1
                self.hiddenBox.alpha = 1
            })
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            println("Push")
        } else {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nYOU WIN!"
            wins += 1
            textView2.text = text
            textView4.text = "RECORD: Wins-\(wins) & Losses-\(losses)"
            UIView.animateWithDuration(0, animations:{ self.winnerBox.alpha = 1
                self.hiddenBox.alpha = 1
            })
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
        winnerBox.alpha = 0
        loserBox.alpha = 0
        hiddenBox.alpha = 0
        pushBox.alpha = 0
        println("New game")
        }
    }
    
    
    @IBOutlet weak var redBox: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }


}

