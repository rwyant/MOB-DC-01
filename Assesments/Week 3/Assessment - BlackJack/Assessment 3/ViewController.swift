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
        self.cardD2.hidden = boolValue
        self.cardP1.hidden = boolValue
        self.cardP2.hidden = boolValue
        self.dealerText.hidden = boolValue
        self.table.hidden = boolValue
        self.playAgain.hidden = boolValue
        self.clearBet.hidden = boolValue
        self.startGameView.hidden = false
        self.add25.hidden = false
        self.add50.hidden = false
        self.add100.hidden = false
        self.add250.hidden = false
        self.add1k.hidden = false
        self.wallettText.text = "Total: $\(wallet)"
    }
    
    
    @IBAction func clearBet(sender: UITapGestureRecognizer) {
            if wallet < 25 {
                felt.image = UIImage(named:"felt2")
                hideResults(true)
                bet = 0
                wallet = 500
                betText.text = "Make your bet by clicking the amounts below"
                wallettText.text = "Total: $\(wallet)"
                println("New game. Bet is starting at 0. Wallet is starting at 500.")
            } else {
                bet = 0
                felt.image = UIImage(named:"felt2")
                betText.text = "Make your bet by clicking the amounts below"
                println("Clear bet back to $0")
        }
    }
    
    
    @IBAction func add25(sender: UITapGestureRecognizer) {
        if (bet + 25) > wallet {
            betText.text = "Sorry, you don't have enough money for that."
        } else {
        bet += 25
        clearBet.hidden = false
        felt.image = UIImage(named:"felt4")
        betText.text = "Your bet is \(bet). Click on the chips to START."
        println("Add $25 to bet")
        }
    }
    @IBAction func add50(sender: UITapGestureRecognizer) {
        if (bet + 50) > wallet {
            betText.text = "Sorry, you don't have enough money for that."
        } else {
            bet += 50
        clearBet.hidden = false
        felt.image = UIImage(named:"felt4")
        betText.text = "Your bet is \(bet). Click on the chips to START."
        println("Add $50 to bet")
        }
    }
    @IBAction func add100(sender: UITapGestureRecognizer) {
        if (bet + 100) > wallet {
            betText.text = "Sorry, you don't have enough money for that."
        } else {
            bet += 100
        clearBet.hidden = false
        felt.image = UIImage(named:"felt4")
        betText.text = "Your bet is \(bet). Click on the chips to START."
        println("Add $100 to bet")
        }
    }
    @IBAction func add250(sender: UITapGestureRecognizer) {
        if (bet + 250) > wallet {
            betText.text = "Sorry, you don't have enough money for that."
        } else {
            bet += 250
        clearBet.hidden = false
        felt.image = UIImage(named:"felt4")
        betText.text = "Your bet is \(bet). Click on the chips to START."
        println("Add $250 to bet")
        }
    }
    @IBAction func add1k(sender: UITapGestureRecognizer) {
        if (bet + 1000) > wallet {
            betText.text = "Sorry, you don't have enough money for that."
        } else {
            bet += 1000
        clearBet.hidden = false
        felt.image = UIImage(named:"felt4")
        betText.text = "Your bet is \(bet). Click on the chips to START."
        println("Add $1000 to bet")
        }
    }
    
    @IBAction func startGame(sender: UITapGestureRecognizer) {
        var startGame = CardGame()
        playerHand = startGame.firstHand()
        if playerHand == 22 {
            betText.text = "Your bet is \(bet). Click on the chips to START."
        } else {
            felt.image = UIImage(named:"felt")
            betText.text = "You're starting with a hand of '\(String(playerHand))'."
            table.hidden = false
            add25.hidden = true
            add50.hidden = true
            add100.hidden = true
            add250.hidden = true
            add1k.hidden = true
            startGameView.hidden = true
            clearBet.hidden = true
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
            betText.text = "SORRY, YOU BUSTED."
            resultText.text = text + "\nRECORD: Wins-\(wins) & Losses-\(losses)"
//            Player lost
            wallet -= bet
            wallettText.text = "Total: $\(wallet)"
            println("Player lost")

            //Play again logic
            felt.image = UIImage(named:"felt3")
            playAgain.hidden = false
            table.hidden = true
        } else {
            var text = "Your new hand is \(String(playerHand))."
            betText.text = text
        }
    }
   
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        var startGame = CardGame()
        
        var dealerHand = startGame.dealerHand()
        if dealerHand > 21 {
            var text = "The dealer busts with a \(dealerHand).\n\nYOU WIN!"
            wins += 1
            resultText.text = text + "RECORD: Wins-\(wins) & Losses-\(losses)"
            felt.image = UIImage(named:"felt3")
            playAgain.hidden = false
            table.hidden = true
//            Player won
            wallet += bet
            wallettText.text = "Total: $\(wallet)"
            println("Player won")
        } else if dealerHand > playerHand {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nSORRY, YOU LOSE."
            losses += 1
            resultText.text = text + "\nRECORD: Wins-\(wins) & Losses-\(losses)"
            felt.image = UIImage(named:"felt3")
            playAgain.hidden = false
            table.hidden = true
//            Player lost
            wallet -= bet
            wallettText.text = "Total: $\(wallet)"
            println("Player lost")
        } else if dealerHand == playerHand {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nLET'S TRY THAT AGAIN, YOU PUSHED."
            felt.image = UIImage(named:"felt3")
            playAgain.hidden = false
            table.hidden = true
            resultText.text = text + "\nRECORD: Wins-\(wins) & Losses-\(losses)"
//              Player pushed
            println("Push")
        } else {
            var text = "The dealer has a hand of \(String(dealerHand)). \n\nYOU WIN!"
            wins += 1
            resultText.text = text + "\nRECORD: Wins-\(wins) & Losses-\(losses)"
            felt.image = UIImage(named:"felt3")
            playAgain.hidden = false
            table.hidden = true
//            Player won
            wallet += bet
            wallettText.text = "Total: $\(wallet)"
            println("Player won")
        }
    }
    
    @IBAction func playAgain(sender: UITapGestureRecognizer) {
        if wallet < 25 {
            felt.image = UIImage(named:"felt5")
            resultText.text = ""
            bet = 0
            playAgain.hidden = true
            betText.text = "GAME OVER"
            println("Player ran out of money. GAME OVER.")
        } else {
            felt.image = UIImage(named:"felt2")
            resultText.text = ""
            bet = 0
            betText.text = "Make your bet by clicking the amounts below"
            println("Bet set to 0")
            startGameView.hidden = false
            clearBet.hidden = false
            add25.hidden = false
            add50.hidden = false
            add100.hidden = false
            add250.hidden = false
            add1k.hidden = false
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideResults(true)

    }
}

