//
//  BattleButton.swift
//  PredictBattle
//
//  Created by Sergey on 16.08.2022.
//

import UIKit

final class BattleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton(title: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(title: String?) {
        super.init(frame: .zero)
        
        configureButton(title: title)
    }
    
    private func configureButton(title: String?) {
        
        configuration?.contentInsets              = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        backgroundColor                           = .inactiveButtonColor
        layer.cornerRadius                        = 18
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
