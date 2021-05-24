//
//  MotivatorsAssembly.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class MotivatorsAssembly {
    static func assemble() -> ModuleNavigationItemProtocol {
        let viewController = MotivatorsViewController()
        let motivatorsService = MotivatorsService()
        viewController.setMotivatorsService(motivatorsService)
        viewController.setNavigator(navigator: Navigator.shared)
        let navigationItem = ModuleNavigationItem(viewController: viewController, moduleTag: .developer)
        return navigationItem
    }
}
