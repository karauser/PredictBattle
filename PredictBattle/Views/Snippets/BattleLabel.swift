//
//  BattleLabel.swift
//  PredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

class BattleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel(text: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(text: String?) {
        super.init(frame: .zero)
        configureLabel(text: text)
    }
    
    private func configureLabel(text: String?) {
        textColor                    = .black
        font                         = .systemFont(ofSize: 18)
        self.text                    = text ?? ""
    }
}


