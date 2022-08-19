//
//  ComputerGuessesNumberView.swift
//  NumberPredictBattle
//
//  Created by Sergey on 18.08.2022.
//

import UIKit

class ComputerGuessesNumberView: UIView {
    
    // MARK: - Public properties
    lazy var numberOfGuessesLabel = BattleLabel(text: "Try №")
    lazy var computerGuessesLabel = BattleLabel(text: "Computer is guessing")
    lazy var guessesLabel         = BattleLabel(text: "Your number is – ")
    lazy var numberIsLabel        = BattleLabel(text: "My number is ..")
    
    lazy var moreButton: CompareButton = {
        let button = CompareButton()
        button.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        return button
    }()

    lazy var equalButton: CompareButton = {
        let button = CompareButton()
        button.setImage(UIImage(systemName: "equal"), for: .normal)
        return button
    }()

    lazy var lessButton: CompareButton = {
        let button = CompareButton()
        button.setImage(UIImage(systemName: "lessthan"), for: .normal)
        return button
    }()
    
    // MARK: - Private properties
    private lazy var buttonsStackView: UIStackView = {
        let stackView          = UIStackView()
        stackView.axis         = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing      = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(moreButton)
        stackView.addArrangedSubview(equalButton)
        stackView.addArrangedSubview(lessButton)
        
        return stackView
    }()
    
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
        
        addSubview(numberOfGuessesLabel)
        addSubview(computerGuessesLabel)
        addSubview(guessesLabel)
        addSubview(numberIsLabel)
        addSubview(buttonsStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
                    
            numberOfGuessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberOfGuessesLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            
            computerGuessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            computerGuessesLabel.topAnchor.constraint(equalTo: numberOfGuessesLabel.bottomAnchor, constant: 10),
            
            guessesLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            guessesLabel.topAnchor.constraint(equalTo: computerGuessesLabel.bottomAnchor, constant: UIScreen.main.bounds.height / 10),
            
            numberIsLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            numberIsLabel.widthAnchor.constraint(equalTo: buttonsStackView.widthAnchor),
            numberIsLabel.bottomAnchor.constraint(equalTo: buttonsStackView.topAnchor, constant: -10),
            
            buttonsStackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            
            moreButton.heightAnchor.constraint(equalToConstant: 50),
            moreButton.widthAnchor.constraint(equalToConstant: 50),
            
            equalButton.heightAnchor.constraint(equalToConstant: 50),
            equalButton.widthAnchor.constraint(equalToConstant: 50),

            lessButton.heightAnchor.constraint(equalToConstant: 50),
            lessButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

