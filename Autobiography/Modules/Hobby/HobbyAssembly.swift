//
//  HobbyAssembly.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class HobbyAssembly {
    static func assemble() -> ModuleNavigationItemProtocol {
        let viewController = HobbyViewController()
        let hobbyService = HobbyService()
        let presenter = HobbyPresenter(hobbyViewController: viewController,
                                       hobbyService: hobbyService,
                                       navigator: Navigator.shared)
        viewController.setPresenter(presenter)
        let navigationItem = ModuleNavigationItem(viewController: viewController, moduleTag: .hobby)
        return navigationItem
    }
}
