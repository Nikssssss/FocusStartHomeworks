//
//  MotivatorsAssembly.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class MotivatorsAssembly {
    static func assemble() -> ModuleNavigationItemProtocol {
        let motivatorsUI = MotivatorsUI()
        
        let motivatorsService = MotivatorsService()
        let navigator = Navigator.shared
        
        let motivatorsCellPresenter = MotivatorsCellPresenter(motivatorsService: motivatorsService)
        let presenter = MotivatorsPresenter(motivatorsUI: motivatorsUI,
                                            motivatorsService: motivatorsService,
                                            navigator: navigator,
                                            motivatorsCellPresenter: motivatorsCellPresenter)
        
        motivatorsUI.setPresenter(presenter)
        presenter.configureUI()
        
        let navigationItem = ModuleNavigationItem(viewController: motivatorsUI, moduleTag: .developer)
        return navigationItem
    }
}
