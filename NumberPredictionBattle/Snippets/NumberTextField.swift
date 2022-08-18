//
//  NumberTextField.swift
//  NumberPredictBattle
//
//  Created by Sergey on 18.08.2022.
//

import UIKit

final class NumberTextField: UITextField {
    
    // MARK: - Override methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    // MARK: - Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    private func configure() {
// option for add custom button to NumPadKeyboad. Delete "//" to activate.
//        addDoneButtonOnKeyboard()
        
        attributedPlaceholder = NSAttributedString(
            string: "Guess the Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textAlignment      = .center
        backgroundColor    = .white
        
        borderStyle        = .roundedRect
        layer.cornerRadius = 20
        
        keyboardType       = .numberPad

        
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
}
