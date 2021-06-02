//
//  Router.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import Foundation
import UIKit

class Navigator {
    static var shared: Navigator = {
        let navigator = Navigator()
        return navigator
    }()
    
    private var moduleNavigator: ModuleNavigatorProtocol?
    
    private init() {}
    
    func start() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "InfoViewController")
        let infoNavigationItem = ModuleNavigationItem(viewController: viewController, moduleTag: .info)
        let developerNavigationItem = DeveloperAssembly.assemble()
        let hobbyNavigationItem = HobbyAssembly.assemble()
        self.moduleNavigator = ModuleNavigator(moduleNavigationItems: [infoNavigationItem,
                                                                       developerNavigationItem,
                                                                       hobbyNavigationItem])
    }
    
    func showTeamsScene() {
        let teamsNavigationItem = TeamsAssembly.assemble()
        self.moduleNavigator?.push(moduleNavigationItem: teamsNavigationItem)
    }
    
    func showMotivatorsScene() {
        let motivatorsNavigationItem = MotivatorsAssembly.assemble()
        self.moduleNavigator?.present(moduleNavigationItem: motivatorsNavigationItem)
    }

    func hideScene(_ navigationItem: ModuleNavigationItemProtocol) {
        self.moduleNavigator?.dismiss(moduleNavigationItem: navigationItem)
    }
    
    func getMainController() -> ModuleNavigationItemProtocol? {
        return self.moduleNavigator?.getMainController()
    }
}
