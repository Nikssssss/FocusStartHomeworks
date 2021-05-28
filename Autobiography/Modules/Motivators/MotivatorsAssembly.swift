//
//  MotivatorsAssembly.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class MotivatorsAssembly {
    static func assemble() -> ModuleNavigationItemProtocol {
        let motivatorsView = MotivatorsView()
        let motivatorsUI = MotivatorsUI(motivatorsView: motivatorsView)
        
        let motivatorsService = MotivatorsService()
        let navigator = Navigator.shared
        
        let motivatorsCellPresenter = MotivatorsCellPresenter(motivatorsService: motivatorsService)
        let presenter = MotivatorsPresenter(motivatorsUI: motivatorsUI,
                                            motivatorsService: motivatorsService,
                                            navigator: navigator,
                                            motivatorsCellPresenter: motivatorsCellPresenter)
        
        motivatorsUI.setPresenter(presenter)
        presenter.configureUI()
        
        let navigationItem = ModuleNavigationItem(viewController: motivatorsUI.viewController, moduleTag: .developer)
        return navigationItem
    }
}
