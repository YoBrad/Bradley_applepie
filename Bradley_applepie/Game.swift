//
//  Game.swift
//  Bradley_applepie
//
//  Created by Petit Bradley on 3/9/21.
//

import Foundation
struct Game{
    
    var word: String
    var remainingMoves: Int
    var guessedLetters: [Character]

    var formattedWord: String {
    var guessedWord = ""
    for letter in word {
        if guessedLetters.contains(letter) {
            guessedWord += "\(letter)"
     }
        else {
        guessedWord += "_"
     }
    }
    return guessedWord
     }


    mutating func playerGuessed(letter: Character) {
    guessedLetters.append(letter)
    if !word.contains(letter) {
        remainingMoves -= 1
    }
        }
}

