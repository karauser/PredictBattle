//
//  HumanPredictNumberView.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

class HumanPredictNumberView: UIView {
    
    // MARK: - Public properties
    lazy var predictionCountLabel      = BattleLabel(text: "Try №")
    lazy var predictionHumanLabel      = BattleLabel(text: "You are guessing")
    lazy var resultLabel               = BattleLabel(text: "")
    lazy var numberPredictionTextField = NumberTextField()
    lazy var numberPredictionButton    = BattleButton(title: "Guess")
    
    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func setupView() {
        backgroundColor = .backgroundColor
        
        addSubview(predictionCountLabel)
        addSubview(predictionHumanLabel)
        addSubview(numberPredictionTextField)
        addSubview(numberPredictionButton)
        addSubview(resultLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            predictionCountLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            predictionCountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            
            predictionHumanLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            predictionHumanLabel.topAnchor.constraint(equalTo: predictionCountLabel.bottomAnchor, constant: 10),
            
            numberPredictionTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberPredictionTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            numberPredictionTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            numberPredictionTextField.bottomAnchor.constraint(equalTo: numberPredictionButton.topAnchor, constant: -UIScreen.main.bounds.height / 30),
            
            
            numberPredictionButton.heightAnchor.constraint(equalToConstant: 48),
            numberPredictionButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberPredictionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: 20),
            numberPredictionButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            numberPredictionButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),

            resultLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: numberPredictionButton.bottomAnchor, constant: 50)
        ])
    }
    
}

