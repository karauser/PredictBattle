//
//  AlertController.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

func getGameAlert(title: String, message: String?) -> UIAlertController {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default)
    
    alert.addAction(action)
    
    return alert

}
