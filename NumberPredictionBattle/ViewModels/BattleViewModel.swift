//
//  BattleViewModel.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import Foundation
import Combine

class BattleViewModel {
    
    // MARK: - Output
    @Published var error: String?
    @Published var game = BattleConfiguration()
    
    func generateRandomNumber() -> Int {
        return Int.random(in: game.minimumNumber...game.maximumNumber)
    }
    
    func checkHumanAnswer(guessNumber: Int) -> NumberSymbol {
        if game.ai.number < guessNumber {
            game.human.attemptsCount += 1
            return .less
        } else if game.ai.number > guessNumber {
            game.human.attemptsCount += 1
            return .more
        } else {
            game.human.isNumberPredicted = true
            return .equal
        }
    }
    
    func checkAIAnswer(answer: NumberSymbol) {
        if answerIsCorrect(answer: answer) {
            switch answer {
            case .more:
                game.minimumNumber = game.ai.number
                game.ai.attemptsCount += 1
                let number = aiBinarySearch()
                game.ai.number = number
            case .less:
                game.maximumNumber = game.ai.number
                game.ai.attemptsCount += 1
                let number = aiBinarySearch()
                game.ai.number = number
            case .equal:
                game.human.isNumberPredicted = true
            }
        }
    }
    
    func aiBinarySearch() -> Int {
        (game.minimumNumber + game.maximumNumber) / 2
    }
    
    private func answerIsCorrect(answer: NumberSymbol) -> Bool {
        if answer == .less && game.human.number >= game.ai.number {
            error = "Don't lie to AI. Your's number more...or equal? ;)"
            return false
        } else if answer == .more && game.human.number <= game.ai.number {
            error = "Don't lie to AI. Your's number less...or equal? ;)"
            return false
        } else if answer == .equal && game.human.number != game.ai.number {
            error = "= mean absolutely equal ;)"
            return false
        }
        return true
    }
    
}
