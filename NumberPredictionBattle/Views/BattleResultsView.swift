//
//  BattleResultsView.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

class BattleResultsView: UIView {

    // MARK: - Public properties
    lazy var scoresLabel          = BattleLabel(text: "Scores:")
    lazy var humanTriesCountLabel = BattleLabel(text: "Your's tries count: ")
    lazy var AITriesCountLabel    = BattleLabel(text: "Computer's tries count: ")
    lazy var resultLabel          = BattleLabel(text: "Win")
    lazy var mainMenuButton       = BattleButton(title: "Main menu")
    
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
        
        addSubview(scoresLabel)
        addSubview(humanTriesCountLabel)
        addSubview(AITriesCountLabel)
        addSubview(resultLabel)
        addSubview(mainMenuButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scoresLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            scoresLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
           
            
            humanTriesCountLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            humanTriesCountLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            humanTriesCountLabel.bottomAnchor.constraint(equalTo: AITriesCountLabel.topAnchor, constant: -20),
            
            AITriesCountLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            AITriesCountLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            AITriesCountLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            AITriesCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: resultLabel.topAnchor),
            
            resultLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: mainMenuButton.topAnchor, constant: -50),
            
            mainMenuButton.heightAnchor.constraint(equalToConstant: 48),
            mainMenuButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            mainMenuButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainMenuButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainMenuButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
}
