//
//  SymbolTextField.swift
//  PredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import Foundation
import UIKit

final class SymbolTextField: UITextField {
    
    
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
    
    placeholder                               = "Guess the number"
    textAlignment                             = .center
    backgroundColor                           = .white
    
    borderStyle                               = .roundedRect
    layer.cornerRadius                        = 20
    
    keyboardType                              = .numberPad
    returnKeyType                             = .done
    
    translatesAutoresizingMaskIntoConstraints = false
    
    addDoneButtonOnKeyboard()
}

}
