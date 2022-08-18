//
//  StartBattleView.swift
//  NumberPredictBattle
//
//  Created by Sergey on 16.08.2022.
//

import UIKit

class StartBattleView: UIView {
    
    // MARK: - Private properties
    private lazy var battleTitleLabel = BattleLabel(text: "My Awesome Game")
    
    // MARK: - Public properties
    var startNewBattleButton          = BattleButton(title: "Start New Game")

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
        
        addSubview(battleTitleLabel)
        addSubview(startNewBattleButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            battleTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            battleTitleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            startNewBattleButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            startNewBattleButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            startNewBattleButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            startNewBattleButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startNewBattleButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
}
