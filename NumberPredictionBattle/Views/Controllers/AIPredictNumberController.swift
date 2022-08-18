//
//  AIPredictNumberController.swift
//  NumberPredictBattle
//
//  Created by Sergey on 18.08.2022.
//

import UIKit
import Combine

class AIPredictNumberController: UIViewController {
    
    // MARK: - Private properties
    private lazy var aiPredictNumberView = ComputerGuessesNumberView()
    private var subscriptions                  = Set<AnyCancellable>()
    
    // MARK: - Public properties
    var viewModel: BattleViewModel!
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = aiPredictNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.game.ai.number = viewModel.generateRandomNumber()
        
        aiPredictNumberView.equalButton.addTarget(
            self, action: #selector(equalButtonPressed(_:)), for: .touchUpInside)
        aiPredictNumberView.moreButton.addTarget(
            self, action: #selector(moreButtonPressed(_:)), for: .touchUpInside)
        aiPredictNumberView.lessButton.addTarget(
            self, action: #selector(lessButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Bind view model
    private func setupBindings() {
        viewModel.$error
            .sink { error in
                DispatchQueue.main.async {
                    guard let errorDiscription = self.viewModel.error else {
                        return
                    }
                    let alertController = getGameAlert(title: "SKYNET is angry!", message: errorDiscription)
                    self.present(alertController, animated: true)
                }
            }
            .store(in: &subscriptions)
        viewModel.$game
            .sink { game in
                self.aiPredictNumberView.guessesLabel.text = "Your number is – \(game.ai.number)?"
                self.aiPredictNumberView.numberOfGuessesLabel.text = "Try №\(game.ai.attemptsCount)"
            }
            .store(in: &subscriptions)
    }
    
    // MARK: - @objc methods
    @objc private func equalButtonPressed(_ sender: UIButton) {
        viewModel.checkAIAnswer(answer: .equal)
        if viewModel.game.human.isNumberPredicted == true {
            startPlayerPredictionNumber()
        }
    }
    
    @objc private func moreButtonPressed(_ sender: UIButton) {
        viewModel.checkAIAnswer(answer: .more)
    }
    
    @objc private func lessButtonPressed(_ sender: UIButton) {
        viewModel.checkAIAnswer(answer: .less)
    }
    
    // MARK: - Navigation
    private func startPlayerPredictionNumber() {
        let viewController = HumanPredictNumberController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
}
