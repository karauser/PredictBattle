//
//  CompareButtons.swift
//  PredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

final class CompareButton: UIButton {
    
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
        
        translatesAutoresizingMaskIntoConstraints = false
        tintColor          = .black
        backgroundColor    = .white
        layer.borderWidth  = 1
        layer.cornerRadius = 10
        layer.borderColor  = UIColor.black.cgColor
    }
}
