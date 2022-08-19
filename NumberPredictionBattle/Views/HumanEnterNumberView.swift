//
//  HumanEnterNumberView.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

class HumanEnterNumberView: UIView {
    
    // MARK: - Private properties
    lazy var predictNumberTextField = NumberTextField()
    lazy var humanEnterNumberButton = BattleButton(title: "Enter the Number")

    // MARK: - Ovveride methods
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
        
        addSubview(predictNumberTextField)
        addSubview(humanEnterNumberButton)
    }
    
    private func setupConstraints() {
        
        
        
        NSLayoutConstraint.activate([
            predictNumberTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            predictNumberTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height / 4),
            predictNumberTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            predictNumberTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            predictNumberTextField.bottomAnchor.constraint(lessThanOrEqualTo: humanEnterNumberButton.topAnchor, constant: 50),
                        
            humanEnterNumberButton.heightAnchor.constraint(equalToConstant: 48),
            humanEnterNumberButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            humanEnterNumberButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            humanEnterNumberButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            humanEnterNumberButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
