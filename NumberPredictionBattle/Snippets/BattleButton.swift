//
//  BattleButton.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

final class BattleButton: ButtonStateControl {
        
    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure(title: nil)
    }
    
    // MARK: - Required methods
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(title: String?) {
        super.init(frame: .zero)
        
        configure(title: title)
    }
    
    // MARK: - Private methods
    private func configure(title: String?) {
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration?.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        
        setTitle(title ?? "", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17)
        titleLabel?.numberOfLines = 1
        backgroundColor           = .inactiveButtonColor
        layer.cornerRadius        = 15
        
        //This configuration for the enable and disable button when user enter wrong symbols.
//        setBackgroundColor(.inactiveButtonColor, for: .disabled)
//        setBackgroundColor(.activeButtonColor, for: .normal)
    }

}
