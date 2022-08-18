//
//  BattleResultsController.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

class BattleResultsController: UIViewController {
    
    // MARK: - Private properties
    private lazy var resultGameView = BattleResultsView()
    
    // MARK: - Public properties
    var viewModel: BattleViewModel!
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = resultGameView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        chooseWinner()
        
        resultGameView.mainMenuButton.addTarget(
            self, action: #selector(goToMainMenuButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Private methods
    private func chooseWinner() {
        let playerTriesConut = viewModel.game.human.attemptsCount
        let aiTriesCount = viewModel.game.ai.attemptsCount
        
        var winner = ""
        
        if playerTriesConut < aiTriesCount {
            winner = "You win"
        } else if aiTriesCount > playerTriesConut {
            winner = "AI win"
        } else if playerTriesConut == aiTriesCount {
            winner = "DRAW!"
        }
        
        resultGameView.humanTriesCountLabel.text = "Your's tries count: \(playerTriesConut)"
        resultGameView.AITriesCountLabel.text = "Computer's tries count: \(aiTriesCount)"
        resultGameView.resultLabel.text = winner
    }
    
    // MARK: - @objc methods
    @objc private func goToMainMenuButtonPressed(_ sender: UIButton) {
        goToMainMenu()
    }
    
    // MARK: - Navigation
    private func goToMainMenu() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
