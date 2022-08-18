//
//  HumanPredictNumberController.swift
//  NumberPredictBattle
//
//  Created by Sergey on 18.08.2022.
//

import UIKit
import Combine

class HumanPredictNumberController: UIViewController {
    
    // MARK: - Private properties
    private lazy var humanNumberPredictionView = HumanPredictNumberView()
    private var subscriptions                  = Set<AnyCancellable>()
    
    // MARK: - Public properties
    var viewModel: BattleViewModel!
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = humanNumberPredictionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
        
        humanNumberPredictionView.numberPredictionButton.addTarget(
            self, action: #selector(numberPredictionButtonPressed(_:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.game.minimumNumber = 1
        viewModel.game.maximumNumber = 100
        viewModel.game.ai.number     = viewModel.generateRandomNumber()
        
  
    }
    
    // MARK: - Private methods
    private func setupBindings() {
        viewModel.$game
            .sink { game in
                self.humanNumberPredictionView.predictionCountLabel.text = "Try №\(game.human.attemptsCount)"
            }
            .store(in: &subscriptions)
    }
    
    private func validateResponse(responce: NumberSymbol) {
        if responce != .equal {
            humanNumberPredictionView.resultLabel.text = "No, my number is \(responce.rawValue) than yours"
        } else {
            goToResultView()
        }
    }
    
    // MARK: - @objc methods
    @objc func numberPredictionButtonPressed(_ sender: UIButton) {
        guard let inputValue = humanNumberPredictionView.numberPredictionTextField.text else {
            return
        }
        
        humanNumberPredictionView.numberPredictionTextField.text = ""
        
        if let number = Int(inputValue) {
            if number >= 1 && number <= 100 {
                let result = viewModel.checkHumanAnswer(guessNumber: number)
                validateResponse(responce: result)
            } else {
                showErrorAlert()
            }
        } else {
            showErrorAlert()
        }
    }
    
    // MARK: - Navigation
    private func goToResultView() {
        let viewController = BattleResultsController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let aletrController = getGameAlert(title: "Error 422", message: "You can enter only numbers from 1 to 100. Please try again.")
        
        present(aletrController, animated: true)
    }
    
}

// MARK: - Dismiss keyboard
extension HumanPredictNumberController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
