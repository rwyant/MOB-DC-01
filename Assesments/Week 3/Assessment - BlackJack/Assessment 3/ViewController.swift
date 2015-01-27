//
//  ViewController.swift
//  Assessment 3
//
//  Created by Tedi Konda on 1/22/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var felt: UIImageView!
    @IBOutlet weak var table: UIView!
    @IBOutlet weak var playAgain: UIView!
    @IBOutlet weak var add25: UIView!
    @IBOutlet weak var add50: UIView!
    @IBOutlet weak var add100: UIView!
    @IBOutlet weak var add250: UIView!
    @IBOutlet weak var add1k: UIView!
    @IBOutlet weak var betText: UITextField!
    @IBOutlet weak var walletText: UITextField!
    @IBOutlet weak var cardP1: UIImageView!
    @IBOutlet weak var cardP2: UIImageView!
    @IBOutlet weak var cardD1: UIImageView!
    @IBOutlet weak var cardD2: UIImageView!
    @IBOutlet weak var dealerText: UILabel!
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var clearBet: UIView!
    @IBOutlet weak var startGameView: UIView!
    @IBOutlet weak var wallettText: UITextField!



    var playerHand = 0
    var wins = 0
    var losses = 0
    var wallet = 500
    var bet = 0

    
    
    func hideResults(boolValue: Bool){
        self.cardD1.hidden = boolValue
        self.cardD1.userInteractionEnabled = false
        self.cardD2.hidden = boolValue
        self.cardD2.userInteractionEnabled = false
        self.cardP1.hidden = boolValue
        self.cardP1.userInteractionEnabled = false
        self.cardP2.hidden = boolValue
        self.cardP2.userInteractionEnabled = false
        self.dealerText.hidden = boolValue
        self.dealerText.userInteractionEnabled = false
        self.table.hidden = boolValue
        self.table.userInteractionEnabled = false
        self.playAgain.hidden = boolValue
        self.playAgain.userInteractionEnabled = false
        self.clearBet.hidden = boolValue
        self.clearBet.userInteractionEnabled = false
        self.startGameView.hidden = false
        self.startGameView.userInteractionEnabled = true
        self.add25.hidden = false
        self.add25.userInteractionEnabled = true
        self.add50.hidden = false
        self.add50.userInteractionEnabled = true
        self.add100.hidden = false
        self.add100.userInteractionEnabled = true
        self.add250.hidden = false
        self.add250.userInteractionEnabled = true
        self.add1k.hidden = false
        self.add1k.userInteractionEnabled = true
        self.wallettText.text = "Total: $\(self.wallet)"
    }
    
    
    @IBAction func clearBet(sender: UITapGestureRecognizer) {
            if self.wallet < 25 {
                self.felt.image = UIImage(named:"felt2")
                hideResults(true)
                self.bet = 0
                self.wallet = 500
                self.betText.text = "Make your bet by clicking the amounts below"
                self.wallettText.text = "Total: $\(self.wallet)"
                println("New game. Bet is starting at 0. Wallet is starting at 500.")
            } else {
                self.bet = 0
                self.felt.image = UIImage(named:"felt2")
                self.betText.text = "Make your bet by clicking the amounts below"
                println("Clear bet back to $0")
        }
    }
    
    
    @IBAction func add25(sender: UITapGestureRecognizer) {
        if (self.bet + 25) > self.wallet {
            self.betText.text = "Sorry, you don't have enough money for that."
        } else {
            self.bet += 25
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.felt.image = UIImage(named:"felt4")
            self.betText.text = "Your bet is \(self.bet). Click on the chips to START."
            println("Add $25 to bet")
        }
    }
    @IBAction func add50(sender: UITapGestureRecognizer) {
        if (self.bet + 50) > self.wallet {
            self.betText.text = "Sorry, you don't have enough money for that."
        } else {
            self.bet += 50
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.felt.image = UIImage(named:"felt4")
            self.betText.text = "Your bet is \(self.bet). Click on the chips to START."
        println("Add $50 to bet")
        }
    }
    @IBAction func add100(sender: UITapGestureRecognizer) {
        if (self.bet + 100) > self.wallet {
            self.betText.text = "Sorry, you don't have enough money for that."
        } else {
            self.bet += 100
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.felt.image = UIImage(named:"felt4")
            self.betText.text = "Your bet is \(self.bet). Click on the chips to START."
        println("Add $100 to bet")
        }
    }
    @IBAction func add250(sender: UITapGestureRecognizer) {
        if (self.bet + 250) > self.wallet {
            self.betText.text = "Sorry, you don't have enough money for that."
        } else {
            self.bet += 250
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.felt.image = UIImage(named:"felt4")
            self.betText.text = "Your bet is \(self.bet). Click on the chips to START."
            println("Add $250 to bet")
        }
    }
    @IBAction func add1k(sender: UITapGestureRecognizer) {
        if (self.bet + 1000) > self.wallet {
            self.betText.text = "Sorry, you don't have enough money for that."
        } else {
            self.bet += 1000
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.felt.image = UIImage(named:"felt4")
            self.betText.text = "Your bet is \(self.bet). Click on the chips to START."
            println("Add $1000 to bet")
        }
    }
    
    @IBAction func startGame(sender: UITapGestureRecognizer) {
        var startGame = CardGame()
        self.playerHand = startGame.firstHand()
        if self.playerHand == 22 {
            self.betText.text = "Your bet is \(self.bet). Click on the chips to START."
        } else {
            self.felt.image = UIImage(named:"felt")
            self.betText.text = "You're starting with a hand of '\(String(self.playerHand))'."
            self.table.hidden = false
            self.table.userInteractionEnabled = true
            self.add25.hidden = true
            self.add25.userInteractionEnabled = false
            self.add50.hidden = true
            self.add50.userInteractionEnabled = false
            self.add100.hidden = true
            self.add100.userInteractionEnabled = false
            self.add250.hidden = true
            self.add250.userInteractionEnabled = false
            self.add1k.hidden = true
            self.add1k.userInteractionEnabled = false
            self.startGameView.hidden = true
            self.startGameView.userInteractionEnabled = false
            self.clearBet.hidden = true
            self.clearBet.userInteractionEnabled = false
            println("New game")
        }
    }
    
  
    @IBAction func doubleTap(sender: UITapGestureRecognizer) {
        var startGame = CardGame()
        
        var dealerHand = startGame.dealerHand()
        self.playerHand += startGame.deal()
        
        if self.playerHand > 21 {

            var text = "Your new hand is \(String(self.playerHand))."
            self.losses += 1
            self.betText.text = "SORRY, YOU BUSTED."
            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
//            Player lost
            self.wallet -= self.bet
            self.wallettText.text = "Total: $\(self.wallet)"
            println("Player lost")

            //Play again logic
            self.felt.image = UIImage(named:"felt3")
            self.playAgain.hidden = false
            self.playAgain.userInteractionEnabled = true
            self.table.hidden = true
            self.table.userInteractionEnabled = false
        } else {
            var text = "Your new hand is \(String(self.playerHand))."
            self.betText.text = text
        }
    }
   
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        var startGame = CardGame()
        
        var dealerHand = startGame.dealerHand()
        if dealerHand > 21 {
            var text = "The dealer busts with a \(dealerHand).\n\nYOU WIN!"
            self.wins += 1
            self.resultText.text = text + "RECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.felt.image = UIImage(named:"felt3")
            self.playAgain.hidden = false
            self.playAgain.userInteractionEnabled = true
            self.table.hidden = true
            self.table.userInteractionEnabled = false
//            Player won
            self.wallet += bet
            self.wallettText.text = "Total: $\(self.wallet)"
            println("Player won")
        } else if dealerHand > playerHand {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nSORRY, YOU LOSE."
            self.losses += 1
            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.felt.image = UIImage(named:"felt3")
            self.playAgain.hidden = false
            self.playAgain.userInteractionEnabled = true
            self.table.hidden = true
            self.table.userInteractionEnabled = false
//            Player lost
            self.wallet -= self.bet
            self.wallettText.text = "Total: $\(self.wallet)"
            println("Player lost")
        } else if dealerHand == self.playerHand {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nLET'S TRY THAT AGAIN, YOU PUSHED."
            self.felt.image = UIImage(named:"felt3")
            self.playAgain.hidden = false
            self.playAgain.userInteractionEnabled = true
            self.table.hidden = true
            self.table.userInteractionEnabled = false
            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
//              Player pushed
            println("Push")
        } else {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nYOU WIN!"
            self.wins += 1
            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.felt.image = UIImage(named:"felt3")
            self.playAgain.hidden = false
            self.playAgain.userInteractionEnabled = true
            self.table.hidden = true
            self.table.userInteractionEnabled = false
//            Player won
            self.wallet += self.bet
            self.wallettText.text = "Total: $\(self.wallet)"
            println("Player won")
        }
    }
    
    @IBAction func playAgain(sender: UITapGestureRecognizer) {
        if self.wallet < 25 {
            self.felt.image = UIImage(named:"felt5")
            self.resultText.text = ""
            self.bet = 0
            self.playAgain.hidden = true
            self.playAgain.userInteractionEnabled = false
            self.betText.text = "GAME OVER"
            println("Player ran out of money. GAME OVER.")
        } else {
            self.felt.image = UIImage(named:"felt2")
            self.resultText.text = ""
            self.bet = 0
            self.betText.text = "Make your bet by clicking the amounts below"
            println("Bet set to 0")
            self.startGameView.hidden = false
            self.startGameView.userInteractionEnabled = true
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.add25.hidden = false
            self.add25.userInteractionEnabled = true
            self.add50.hidden = false
            self.add50.userInteractionEnabled = true
            self.add100.hidden = false
            self.add100.userInteractionEnabled = true
            self.add250.hidden = false
            self.add250.userInteractionEnabled = true
            self.add1k.hidden = false
            self.add1k.userInteractionEnabled = true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideResults(true)

    }
}

