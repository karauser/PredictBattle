//
//  Keyboard & TextField.swift
//  NumberPredictBattle
//
//  Created by Sergey on 18.08.2022.
//

import UIKit


// MARK: - Dismiss keyboard by the touch
extension HumanEnterNumberController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
}


