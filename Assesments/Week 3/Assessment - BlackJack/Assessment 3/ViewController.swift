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
    @IBOutlet weak var cardP3: UIImageView!
    @IBOutlet weak var cardP4: UIImageView!
    @IBOutlet weak var cardP5: UIImageView!
    @IBOutlet weak var cardP6: UIImageView!
    @IBOutlet weak var cardD1: UIImageView!
    @IBOutlet weak var cardD2: UIImageView!
    @IBOutlet weak var cardD3: UIImageView!
    @IBOutlet weak var cardD4: UIImageView!
    @IBOutlet weak var cardD5: UIImageView!
    @IBOutlet weak var dealerText: UILabel!
    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var clearBet: UIView!
    @IBOutlet weak var startGameView: UIView!
    @IBOutlet weak var wallettText: UITextField!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var swipeView: UIView!



    var playerHand = 0
    var wins = 0
    var losses = 0
    var wallet = 500
    var bet = 0
    
    var card1P = 0
    var card2P = 0
    var card3P = 0
    var card4P = 0
    var card5P = 0
    var card6P = 0
    var card1D = 0
    var card2D = 0
    var card3D = 0
    var card4D = 0
    var card5D = 0
    
    func hideResults(boolValue: Bool){
        self.cardD1.hidden = boolValue
        self.cardD1.userInteractionEnabled = false
        self.cardD2.hidden = boolValue
        self.cardD2.userInteractionEnabled = false
        self.cardD3.hidden = boolValue
        self.cardD3.userInteractionEnabled = false
        self.cardD4.hidden = boolValue
        self.cardD4.userInteractionEnabled = false
        self.cardD5.hidden = boolValue
        self.cardD5.userInteractionEnabled = false
//        self.cardP1.hidden = boolValue
//        self.cardP1.userInteractionEnabled = false
//        self.cardP2.hidden = boolValue
//        self.cardP2.userInteractionEnabled = false
        self.cardP3.hidden = boolValue
        self.cardP3.userInteractionEnabled = false
        self.cardP4.hidden = boolValue
        self.cardP4.userInteractionEnabled = false
        self.cardP5.hidden = boolValue
        self.cardP5.userInteractionEnabled = false
        self.cardP6.hidden = boolValue
        self.cardP6.userInteractionEnabled = false
        self.swipeView.hidden = boolValue
        self.swipeView.userInteractionEnabled = false
        self.dealerText.hidden = boolValue
        self.dealerText.userInteractionEnabled = false
        self.table.hidden = boolValue
        self.table.userInteractionEnabled = false
        self.playAgain.hidden = boolValue
        self.playAgain.userInteractionEnabled = false
        self.clearBet.hidden = boolValue
        self.clearBet.userInteractionEnabled = false
        self.startGameView.hidden = boolValue
        self.startGameView.userInteractionEnabled = false
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
        self.playerScore.text = ""
    }
    
    @IBAction func add25(sender: UITapGestureRecognizer) {
        if (self.bet + 25) > self.wallet {
            self.betText.text = "Sorry, you don't have enough money for that."
        } else {
            self.bet += 25
            self.clearBet.hidden = false
            self.clearBet.userInteractionEnabled = true
            self.felt.image = UIImage(named:"felt4")
            self.betText.text = "Your bet is $\(self.bet). Click on the chips to START."
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
            self.betText.text = "Your bet is $\(self.bet). Click on the chips to START."
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
            self.betText.text = "Your bet is $\(self.bet). Click on the chips to START."
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
            self.betText.text = "Your bet is $\(self.bet). Click on the chips to START."
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
            self.betText.text = "Your bet is $\(self.bet). Click on the chips to START."
            println("Add $1000 to bet")
        }
    }
    
    @IBAction func clearBet(sender: UITapGestureRecognizer) {
        if self.wallet < 25 {
            self.felt.image = UIImage(named:"felt2")
            hideResults(true)
            self.bet = 0
            self.wallet = 500
            self.betText.text = "Make your bet by clicking the amounts below"
            self.wallettText.text = "Total: $\(self.wallet)"
            changeCardsBack()
            self.startGameView.hidden = true
            self.startGameView.userInteractionEnabled = false
            println("New game. Bet is starting at 0. Wallet is starting at 500.")
        } else {
            self.bet = 0
            self.felt.image = UIImage(named:"felt2")
            self.betText.text = "Make your bet by clicking the amounts below"
            self.startGameView.hidden = true
            self.startGameView.userInteractionEnabled = false
            println("Clear bet back to $0")
        }
    }
    
    @IBAction func startGame(sender: UITapGestureRecognizer) {
        var startGame = CardGame()
        self.card1P = startGame.card()
        self.card2P = startGame.card()
        if card1P == 11 && card2P == 11 {
            card1P = 1
            card2P = 1
        } else if card1P == 1 {card1P = 11}
            else if card2P == 1 {card2P = 11}
        self.playerHand = self.card1P + self.card2P
        self.playerScore.text = "(\(playerHand))"
        self.cardP1.image = UIImage(named:"\(self.card1P)")
        self.cardP2.image = UIImage(named:"\(self.card2P)")
        self.felt.image = UIImage(named:"felt")
        self.betText.text = "You're starting with a hand of '\(String(self.playerHand))'."
        self.table.hidden = false
        self.table.userInteractionEnabled = true
        self.swipeView.hidden = false
        self.swipeView.userInteractionEnabled = true
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
  
    @IBAction func doubleTap(sender: UITapGestureRecognizer) {
        doubledTap()
    }
    
    @IBAction func doubleTap2(sender: UITapGestureRecognizer) {
        doubledTap()
    }
    
    func doubledTap() {
        var startGame = CardGame()
        
        //        var dealerHand = startGame.dealerHand()
        
        if self.card3P == 0 {
            self.card3P = startGame.card()
            self.playerHand += card3P
            self.cardP3.image = UIImage(named:"\(self.card3P)")
            self.cardP3.hidden = false
            self.cardP3.userInteractionEnabled = true
            self.playerScore.text = "(\(playerHand))"
            println("\(self.card3P)")
        } else if self.card4P == 0 {
            self.card4P = startGame.card()
            self.playerHand += card4P
            self.cardP4.image = UIImage(named:"\(self.card4P)")
            self.cardP4.hidden = false
            self.cardP4.userInteractionEnabled = true
            self.playerScore.text = "(\(playerHand))"
            println("\(self.card4P)")
        } else if self.card5P == 0 {
            self.card5P = startGame.card()
            self.playerHand += card5P
            self.cardP5.image = UIImage(named:"\(self.card5P)")
            self.cardP5.hidden = false
            self.cardP5.userInteractionEnabled = true
            self.playerScore.text = "(\(playerHand))"
            println("\(self.card5P)")
        } else {
            self.card6P = startGame.card()
            self.playerHand += card6P
            self.cardP6.image = UIImage(named:"\(self.card6P)")
            self.cardP6.hidden = false
            self.cardP6.userInteractionEnabled = true
            self.playerScore.text = "(\(playerHand))"
            println("\(self.card6P)")
        }
        if self.playerHand > 21 {
            //            var text = "Your new hand is \(String(self.playerHand))."
            //            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.felt.image = UIImage(named:"felt3b")
            self.betText.text = "SORRY, YOU BUSTED."
            playerLoss()
        } else {
            var text = "Your new hand is \(String(self.playerHand))."
            self.betText.text = text
        }
    }
    
    func swipedRight() {
        var startGame = CardGame()
        card1D = startGame.card()
        card2D = startGame.card()
        card3D = startGame.card()
        card4D = startGame.card()
        card5D = startGame.card()
        var dealerHand = 0
        
        if card1D + card2D > 16 {
            self.cardD1.hidden = false
            self.cardD1.userInteractionEnabled = true
            self.cardD1.image = UIImage(named:"\(card1D)")
            self.cardD2.hidden = false
            self.cardD2.userInteractionEnabled = true
            self.cardD2.image = UIImage(named:"\(card2D)")
            self.dealerText.hidden = false
            self.dealerText.userInteractionEnabled = true
            dealerHand = card1D + card2D
            self.dealerText.text = "Dealer: (\(dealerHand))"
        } else if card1D + card2D + card3D > 16 {
            self.cardD1.hidden = false
            self.cardD1.userInteractionEnabled = true
            self.cardD1.image = UIImage(named:"\(card1D)")
            self.cardD2.hidden = false
            self.cardD2.userInteractionEnabled = true
            self.cardD2.image = UIImage(named:"\(card2D)")
            self.cardD3.hidden = false
            self.cardD3.userInteractionEnabled = true
            self.cardD3.image = UIImage(named:"\(card3D)")
            self.dealerText.hidden = false
            self.dealerText.userInteractionEnabled = true
            dealerHand = card1D + card2D + card3D
            self.dealerText.text = "Dealer: (\(dealerHand))"
        } else if card1D + card2D + card3D + card4D > 16 {
            self.cardD1.hidden = false
            self.cardD1.userInteractionEnabled = true
            self.cardD1.image = UIImage(named:"\(card1D)")
            self.cardD2.hidden = false
            self.cardD2.userInteractionEnabled = true
            self.cardD2.image = UIImage(named:"\(card2D)")
            self.cardD3.hidden = false
            self.cardD3.userInteractionEnabled = true
            self.cardD3.image = UIImage(named:"\(card3D)")
            self.cardD4.hidden = false
            self.cardD4.userInteractionEnabled = true
            self.cardD4.image = UIImage(named:"\(card4D)")
            self.dealerText.hidden = false
            self.dealerText.userInteractionEnabled = true
            dealerHand = card1D + card2D + card3D + card4D
            self.dealerText.text = "Dealer: (\(dealerHand))"
        } else {
            self.cardD1.hidden = false
            self.cardD1.userInteractionEnabled = true
            self.cardD1.image = UIImage(named:"\(card1D)")
            self.cardD2.hidden = false
            self.cardD2.userInteractionEnabled = true
            self.cardD2.image = UIImage(named:"\(card2D)")
            self.cardD3.hidden = false
            self.cardD3.userInteractionEnabled = true
            self.cardD3.image = UIImage(named:"\(card3D)")
            self.cardD4.hidden = false
            self.cardD4.userInteractionEnabled = true
            self.cardD4.image = UIImage(named:"\(card4D)")
            self.cardD5.hidden = false
            self.cardD5.userInteractionEnabled = true
            self.cardD5.image = UIImage(named:"\(card5D)")
            self.dealerText.hidden = false
            self.dealerText.userInteractionEnabled = true
            dealerHand = card1D + card2D + card3D + card4D + card5D
            self.dealerText.text = "Dealer: (\(dealerHand))"
        }
        if dealerHand == self.playerHand {
            //            var text = "The dealer has a hand of \(String(dealerHand)). \n\nLET'S TRY THAT AGAIN, YOU PUSHED."
            //            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.betText.text = "YOU PUSHED WITH THE DEALER."
            playerPush()
            println("Push")
        } else if playerHand == 21 && card3P == 0 {
            playerWon()
            self.betText.text = "YOU GOT BLACKJACK!"
            self.felt.image = UIImage(named:"felt3d")
            self.wallet += bet/2
            self.wallettText.text = "Total: $\(self.wallet)"
        } else if playerHand == 21 {
            playerWon()
            self.betText.text = "YOU GOT BLACKJACK!"
            self.felt.image = UIImage(named:"felt3d")
        } else if dealerHand > 21 {
            //            var text = "The dealer busts with a \(dealerHand).\n\nYOU WIN!"
            //            self.resultText.text = text + "RECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.betText.text = "THE DEALER BUSTED, YOU WIN!"
            playerWon()
        } else if dealerHand > playerHand {
            //            var text = "The dealer has a hand of \(String(dealerHand)). \n\nSORRY, YOU LOSE."
            //            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.betText.text = "THE DEALER BEAT YOU."
            playerLoss()
        } else {
            //            var text = "The dealer has a hand of \(String(dealerHand)). \n\nYOU WIN!"
            //            self.resultText.text = text + "\nRECORD: Wins-\(self.wins) & Losses-\(self.losses)"
            self.betText.text = "YOU WIN!"
            playerWon()
        }

    }
    
    @IBAction func swipeRight2(sender: UISwipeGestureRecognizer) {
        swipedRight()
    }
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        swipedRight()
           }
    
    @IBAction func playAgain(sender: UITapGestureRecognizer) {
        if self.wallet < 25 {
            changeCardsBack()
            self.cardP1.hidden = true
            self.cardP1.userInteractionEnabled = false
            self.cardP2.hidden = true
            self.cardP2.userInteractionEnabled = false
            self.felt.image = UIImage(named:"felt5")
            self.resultText.text = ""
            self.bet = 0
            self.playAgain.hidden = true
            self.playAgain.userInteractionEnabled = false
            self.betText.text = "GAME OVER"
            println("Player ran out of money. GAME OVER.")
        } else {
            self.felt.image = UIImage(named:"felt2")
            self.startGameView.hidden = true
            self.startGameView.userInteractionEnabled = false
            self.resultText.text = ""
            self.bet = 0
            self.betText.text = "Make your bet by clicking the amounts below"
            println("Bet set to 0")
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
            changeCardsBack()
        }
    }
    
    func changeCardsBack () {
        self.cardD1.hidden = true
        self.cardD1.userInteractionEnabled = false
        self.cardD2.hidden = true
        self.cardD2.userInteractionEnabled = false
        self.cardD3.hidden = true
        self.cardD3.userInteractionEnabled = false
        self.cardD4.hidden = true
        self.cardD4.userInteractionEnabled = false
        self.cardD5.hidden = true
        self.cardD5.userInteractionEnabled = false
        self.cardP1.hidden = false
        self.cardP1.userInteractionEnabled = true
        self.cardP2.hidden = false
        self.cardP2.userInteractionEnabled = true
        self.cardP3.hidden = true
        self.cardP3.userInteractionEnabled = false
        self.cardP4.hidden = true
        self.cardP4.userInteractionEnabled = false
        self.cardP5.hidden = true
        self.cardP5.userInteractionEnabled = false
        self.cardP5.hidden = true
        self.cardP5.userInteractionEnabled = false
        self.cardP6.hidden = true
        self.cardP6.userInteractionEnabled = false
        self.cardP1.image = UIImage(named:"back")
        self.cardP2.image = UIImage(named:"back")
        self.card3P = 0
        self.card4P = 0
        self.card5P = 0
        self.card6P = 0
        self.swipeView.hidden = true
        self.swipeView.userInteractionEnabled = false
        self.startGameView.hidden = true
        self.startGameView.userInteractionEnabled = false
        self.dealerText.hidden = true
        self.dealerText.userInteractionEnabled = false
        self.playerScore.text = ""
    }
    
    func playerPush() {
        self.wallettText.text = "Total: $\(self.wallet)"
        self.felt.image = UIImage(named:"felt3c")
        self.playAgain.hidden = false
        self.playAgain.userInteractionEnabled = true
        self.table.hidden = true
        self.table.userInteractionEnabled = false
        self.swipeView.hidden = true
        self.swipeView.userInteractionEnabled = false
    }
    
    func playerWon() {
        self.wins += 1
        self.wallet += bet
        playerPush()
        self.felt.image = UIImage(named:"felt3")
        println("Player won")
    }
    
    func playerLoss() {
        self.losses += 1
        self.wallet -= bet
        playerPush()
        self.felt.image = UIImage(named:"felt3b")
        println("Player lost")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideResults(true)

    }
}

