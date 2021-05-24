//
//  DeveloperAssembly.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class DeveloperAssembly {
    static func assemble() -> ModuleNavigationItemProtocol {
        let viewController = DeveloperViewController()
        viewController.setNavigator(Navigator.shared)
        let navigationItem = ModuleNavigationItem(viewController: viewController, moduleTag: .developer)
        return navigationItem
    }
}
