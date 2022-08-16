//
//  Keyboard & TextField.swift
//  PredictBattle
//
//  Created by Sergey on 16.08.2022.
//

import UIKit

// MARK: - Dismiss keyboard by the touch
extension UIViewController {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
