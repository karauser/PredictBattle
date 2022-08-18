//
//  HumanEnterNumberController.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit
import Combine

class HumanEnterNumberController: UIViewController {

    // MARK: - Private properties
    private lazy var enterNumberView = HumanEnterNumberView()
    private var cancellable: AnyCancellable?
    private var isButtonEnabled: Bool?
    // MARK: - Public properties
    var viewModel = BattleViewModel()
    var battle    = BattleConfiguration()
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = enterNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        enterNumberView.predictNumberTextField.delegate = self
        
        enterNumberView.humanEnterNumberButton.isUserInteractionEnabled = false
        enterNumberView.humanEnterNumberButton.backgroundColor = .inactiveButtonColor
       
        enterNumberView.humanEnterNumberButton.addTarget(self, action: #selector(enterTheNumberButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - @objc methods
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
              //we can also change constraints runtime
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
          //this area will set old constraints again
        }
    }

    @objc private func enterTheNumberButtonPressed(_ sender: UIButton) {
        guard let inputValue = enterNumberView.predictNumberTextField.text else {
            return
        }
        
        if let number = Int(inputValue) {
            if number >= battle.minimumNumber && number <= battle.maximumNumber {
                viewModel.game.human.number = number
                startAIPredictionNumber()
            } else {
                showErrorAlert()
            }
        } else {
            showErrorAlert()
        }
    }
    
    // MARK: - Navigation
    private func startAIPredictionNumber() {
        let viewController = AIPredictNumberController()
        viewController.viewModel = self.viewModel
        viewController.modalPresentationStyle = .fullScreen
        
        self.present(viewController, animated: true)
    }
    
    private func showErrorAlert() {
        let aletrController = getGameAlert(title: "Error", message: "Please enter a number from 1 to 100")
        
        present(aletrController, animated: true)
    }

}

// MARK: - UITextFieldDelegate
extension HumanEnterNumberController: UITextFieldDelegate {
  
    func textFieldDidBeginEditing(_ textField: UITextField) {

        // This configuration for .active button state control.
        
        
//        cancellable = NotificationCenter.default
//                .publisher(for: UITextField.textDidChangeNotification, object: enterNumberView.predictNumberTextField)
//            .map { $0.object as? UITextField }
//            .compactMap { $0?.text }
//            .map { str -> Bool in
//                if let number = Int(str) {
//                    return number > 1
//                } else {
//                    return false
//                }
//            }
//            .assign(to: \.isEnabled, on: enterNumberView.humanEnterNumberButton)
//
        enterNumberView.humanEnterNumberButton.isUserInteractionEnabled = true
        enterNumberView.humanEnterNumberButton.backgroundColor = .activeButtonColor

    }
}
