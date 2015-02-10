//
//  ViewController.swift
//  Hangman
//
//  Created by Rob Wyant on 2/8/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, PassLetter {
    
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var gameBoard: UIView!
    @IBOutlet weak var puzzleLabel: UILabel!
    @IBOutlet weak var incorrectGuessesLabel: UILabel!
    @IBOutlet weak var gameOverImage: UIImageView!
    @IBOutlet weak var drawHangmanLabel: UILabel!
    @IBOutlet weak var keyboardLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var guessALetterButton: UIButton!

    
    var xValue = 0
    var yValue = 0
    var keyboardValue = 0
    var gameLetterValue = 0
    var gameBoardXValue = 0
    var gameBoardYValue = 0
    var letter = ""
    var puzzleDict = ["p":"_","r":"_","a":"_","g":"_","m":"_","t":"_","i":"_","c":"_","l":"_","y":"_","o":"_"]
    var puzzle = ["p","r","o","g","r","a","m","a","t","i","c","a","l","l","y"]
    var lettersDict = ["a":"a","b":"b","c":"c","d":"d","e":"e","f":"f","g":"g","h":"h","i":"i","j":"j","k":"k","l":"l","m":"m","n":"n","o":"o","p":"p","q":"q","r":"r","s":"s","t":"t","u":"u","v":"v","w":"w","x":"x","y":"y","z":"z"]
    var arrayOfLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    var arrayOfIncorrectGuesses:[String] = []
    var arrayDrawingHangman = ["            __________","            ||        |","            ||","            ||","            ||","            ||","            ||","================"]
    
    
// Buttons to switch view controllers so you can guess a letter
    @IBAction func guessALetterVC2(sender: AnyObject) {
        guessALetterVCFunc()
    }
    @IBAction func guessALetterVC(sender: AnyObject) {
        guessALetterVCFunc()
    }
    func guessALetterVCFunc() {
        var guessALetterVC = self.storyboard?.instantiateViewControllerWithIdentifier("guessALetterVC") as GuessALetterViewController
        guessALetterVC.delegate = self
        self.presentViewController(guessALetterVC, animated: true, completion: nil)
    }
    
// Function that displays the keyboard
    func displayKeyboard() {
        for i in 0...25{
            if letter == arrayOfLetters[i] {
                lettersDict[self.letter] = " "
            }
        }
        var keyboardArray: [String] = []
        for i in 0...25 {
            var appendingValue:String = ""
            appendingValue = lettersDict[arrayOfLetters[i]]!
            keyboardArray.append(appendingValue)
        }
        keyboardLabel.text = " ".join(keyboardArray)
    }
    
// Function that checks to see if the letter is in the puzzle. If it is, this function passes you off to 'createGameBoard. If not, this function will start drawing HANGMAN. If HANGMAN is dead, this function will end your game.
    func checkLetterInPuzzle() {
        var checkInt = 0
        
        for i in 0...14{
            if letter == puzzle[i] {
                puzzleDict[self.letter] = self.letter
                checkInt += 1
            } else {}
        }
        
        if checkInt == 0 {
            arrayOfIncorrectGuesses.append(letter)
            incorrectGuessesLabel.text = " ".join(arrayOfIncorrectGuesses)
        }
        
        switch arrayOfIncorrectGuesses.count {
        case 1: self.arrayDrawingHangman[2] = "            ||      👱"
        case 2: self.arrayDrawingHangman[3] = "            ||      👕"
        case 3: self.arrayDrawingHangman[3] = "            ||  👊👕"
        case 4: self.arrayDrawingHangman[3] = "            ||  💪👕👎"
        case 5: self.arrayDrawingHangman[4] = "            ||      👖"
        case 6: self.arrayDrawingHangman[5] = "            ||     👞👞"
        case 7: self.arrayDrawingHangman[2] = "            ||      😵  🔫"
        default: println("Nice, '\(self.letter)' was a valid letter!")
        }
        
        if arrayOfIncorrectGuesses.count == 7 {
            displayAlert(title: "Game Over", message: "Oh no! You just killed the \n[EMOJI] Hangman. Try guessing \nbetter next time! 😉 ", buttonText: "Okay")
            self.guessALetterButton.hidden = true
            self.guessALetterButton.userInteractionEnabled = false
            self.keyboardView.userInteractionEnabled = false
            self.playAgainButton.hidden = false
            self.playAgainButton.userInteractionEnabled = true
            println("GAME OVER")
        }
        
        var winningInt = 0
        for i in 0...puzzle.count-1 {
            if puzzleDict[puzzle[i]] == "_" {
                winningInt += 1
            }
        }
        
        if winningInt == 0 {
            displayAlert(title: "You Win", message: "You saved [EMOJI] Hangman's life by guessing all of the correct letters. Great job!", buttonText: "Okay")
            self.guessALetterButton.hidden = true
            self.guessALetterButton.userInteractionEnabled = false
            self.keyboardView.userInteractionEnabled = false
            self.playAgainButton.hidden = false
            self.playAgainButton.userInteractionEnabled = true
            println("YOU WIN")
        }
        
        createGameBoard()
    }
    
// Play again function
    @IBAction func playAgainFunction(sender: AnyObject) {
        self.xValue = 0
        self.yValue = 0
        self.keyboardValue = 0
        self.gameLetterValue = 0
        self.gameBoardXValue = 0
        self.gameBoardYValue = 0
        self.letter = ""
        self.puzzleDict = ["r":"_","u":"_","m":"_","p":"_","e":"_","l":"_","s":"_","t":"_","i":"_","k":"_","n":"_"]
        self.puzzle = ["r","u","m","p","e","l","s","t","i","l","t","s","k","i","n"]
        self.lettersDict = ["a":"a","b":"b","c":"c","d":"d","e":"e","f":"f","g":"g","h":"h","i":"i","j":"j","k":"k","l":"l","m":"m","n":"n","o":"o","p":"p","q":"q","r":"r","s":"s","t":"t","u":"u","v":"v","w":"w","x":"x","y":"y","z":"z"]
        self.arrayOfLetters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
        self.arrayOfIncorrectGuesses = []
        self.arrayDrawingHangman = ["            __________","            ||        |","            ||","            ||","            ||","            ||","            ||","================"]
        self.playAgainButton.hidden = true
        self.playAgainButton.userInteractionEnabled = false
        createGameBoard()
        incorrectGuessesLabel.text = ""
        drawHangmanLabel.text = "\n".join(arrayDrawingHangman)
        keyboardLabel.text = " ".join(arrayOfLetters)
        self.guessALetterButton.hidden = false
        self.guessALetterButton.userInteractionEnabled = true
        self.keyboardView.userInteractionEnabled = true

    }
    
    
// This function displays the puzzle. If a correct letter is guessed, this function changes it from an underscore to the actual letter.
    func createGameBoard() {
        var puzzleArray:[String] = []
        for i in 0...14 {
            puzzleArray.append(puzzleDict[puzzle[i]]!)
        }
        drawHangmanLabel.text = "\n".join(arrayDrawingHangman)
        puzzleLabel.text = " ".join(puzzleArray)
        displayKeyboard()
    }
    
// This is the delegate function
    func passLetterText(textInfo: String) {
        letter = textInfo
        letter = String(letter).lowercaseString
    }
    
// This function displays an alert
    func displayAlert(#title: String, message: String, buttonText: String) {
        let alert = UIAlertView()
        alert.title = title
        alert.message = message
        alert.addButtonWithTitle(buttonText)
        alert.show()
    }
    
// This function is called every time you return from guessing a letter
    override func viewWillAppear(animated: Bool) {
        if lettersDict[self.letter] == " " {
            displayAlert(title: "Letter Used", message: "Sorry, you have already guessed that letter. Please select from the list of unused letters.", buttonText: "Okay")
        } else if letter == "" { } else {
            self.checkLetterInPuzzle()
        }
    }
    
// Starts the game
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.playAgainButton.hidden = true
        self.playAgainButton.userInteractionEnabled = false
        createGameBoard()
        incorrectGuessesLabel.text = ""
        drawHangmanLabel.text = "\n".join(arrayDrawingHangman)
        keyboardLabel.text = " ".join(arrayOfLetters)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

