//
//  BattleLabel.swift
//  NumberPredictBattle
//
//  Created by Sergey on 18.08.2022.
//

import UIKit

class BattleLabel: UILabel {

    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure(text: nil)
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(text: String?) {
        super.init(frame: .zero)
        
        configure(text: text)
    }
    
    // MARK: - Private methods
    private func configure(text: String?) {
        font      = UIFont.systemFont(ofSize: 18)
        textColor = .black
        self.text = text ?? ""
        translatesAutoresizingMaskIntoConstraints = false
    }
}

