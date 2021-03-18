//
//  ViewController.swift
//  Bradley_applepie
//
//  Created by Petit Bradley on 3/4/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    var currentGame: Game!
    
    @IBOutlet weak var CorrectWordLabel: UILabel!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    var listOfWords = ["hot", "stop", "mop", "blue", "cap"]
    let lives = 7
    var totalWins = 0{
        didSet {
        newRound()
         }
        }
    var totalLoses = 0{
        didSet {
        newRound()
         }
        }

    
    @IBOutlet var LetterButtons: [UIButton]!
    
    
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, remainingMoves: lives, guessedLetters:[])
            enableLetterButtons(true)
            updateUI()
        }
        else{
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool){
        for button in LetterButtons{
            button.isEnabled = enable
        }
    }
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        updateGameState()


    }
    
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }

        let wordWithSpacing = letters.joined(separator: "")
        CorrectWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Loses: \(totalLoses)"
        imageView.image = UIImage(named: "Tree \(currentGame.remainingMoves)")

    }
    
    func updateGameState() {
        if currentGame.remainingMoves == 0 {
            totalLoses += 1
        }
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
        else {
            updateUI()
        }
    }


    
    
}

