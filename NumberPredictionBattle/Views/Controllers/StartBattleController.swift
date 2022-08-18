//
//  StartBattleController.swift
//  NumberPredictBattle
//
//  Created by Sergey on 17.08.2022.
//

import UIKit

class StartBattleController: UIViewController {
    
    // MARK: - Private properties
    private lazy var startBattleView = StartBattleView()
    
    // MARK: - Override methods
    override func loadView() {
        super.loadView()
        
        self.view = startBattleView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startBattleView.startNewBattleButton.addTarget(self, action: #selector(startNewGameButtonPressed(_:)), for: .touchUpInside)
    }
    
    // MARK: - Navigation
    @objc private func startNewGameButtonPressed(_ sender: UIButton) {
        let viewController = HumanEnterNumberController()
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
    
}
