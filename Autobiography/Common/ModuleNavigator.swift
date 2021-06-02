//
//  ModuleNavigator.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation
import class UIKit.UITabBarController
import class UIKit.UINavigationController
import class UIKit.UIViewController

enum ModuleTag {
    case info, developer, hobby
}

protocol ModuleNavigationItemProtocol: class {
    var viewController: UIViewController { get set }
    var moduleTag: ModuleTag? { get set }
}

class ModuleNavigationItem: ModuleNavigationItemProtocol {
    var viewController: UIViewController
    var moduleTag: ModuleTag?
    
    init(viewController: UIViewController, moduleTag: ModuleTag?) {
        self.viewController = viewController
        self.moduleTag = moduleTag
    }
}

protocol ModuleNavigatorProtocol: class {
    func getMainController() -> ModuleNavigationItemProtocol
    func push(moduleNavigationItem: ModuleNavigationItemProtocol)
    func dismiss(moduleNavigationItem: ModuleNavigationItemProtocol)
    func present(moduleNavigationItem: ModuleNavigationItemProtocol)
}

class ModuleNavigator: ModuleNavigatorProtocol {
    private var tabBarController: UITabBarController
    private var infoNavigationController: UINavigationController
    private var developerNavigationController: UINavigationController
    private var hobbyNavigationController: UINavigationController
    
    init(moduleNavigationItems: [ModuleNavigationItemProtocol]) {
        self.tabBarController = UITabBarController()
        self.infoNavigationController = UINavigationController()
        self.developerNavigationController = UINavigationController()
        self.hobbyNavigationController = UINavigationController()
        self.configureNavigationControllers(using: moduleNavigationItems)
        self.tabBarController.setViewControllers([self.infoNavigationController,
                                                  self.developerNavigationController,
                                                  self.hobbyNavigationController], animated: true)
    }
    
    func getMainController() -> ModuleNavigationItemProtocol {
        let navigationItem = ModuleNavigationItem(viewController: self.tabBarController, moduleTag: nil)
        return navigationItem
    }
    
    func push(moduleNavigationItem: ModuleNavigationItemProtocol) {
        let navigationController = self.getNavigationController(with: moduleNavigationItem.moduleTag)
        navigationController.pushViewController(moduleNavigationItem.viewController, animated: true)
    }
    
    func dismiss(moduleNavigationItem: ModuleNavigationItemProtocol) {
        let navigationController = self.getNavigationController(with: moduleNavigationItem.moduleTag)
        navigationController.dismiss(animated: true)
    }
    
    func present(moduleNavigationItem: ModuleNavigationItemProtocol) {
        let navigationController = self.getNavigationController(with: moduleNavigationItem.moduleTag)
        let viewController = moduleNavigationItem.viewController
        let presentedNavigationController = UINavigationController(rootViewController: viewController)
        navigationController.present(presentedNavigationController, animated: true)
    }
}

private extension ModuleNavigator {
    func configureNavigationControllers(using moduleNavigationItems: [ModuleNavigationItemProtocol]) {
        moduleNavigationItems.forEach { moduleNavigationItem in
            let viewController = moduleNavigationItem.viewController
            guard let tag = moduleNavigationItem.moduleTag else { return }
            switch tag {
            case .info:
                let infoViewControllerTabImageTitle = "info.circle"
                let infoViewControllerTabTitle = "Инфо"
                self.configureNavigationController(&self.infoNavigationController,
                                                   rootViewController: viewController,
                                                   tabTitle: infoViewControllerTabTitle,
                                                   tabImageTitle: infoViewControllerTabImageTitle)
            case .developer:
                self.configureNavigationController(&self.developerNavigationController,
                                                   rootViewController: viewController,
                                                   tabTitle: DeveloperConstants.tabBarItemTitle,
                                                   tabImageTitle: DeveloperConstants.tabBarItemImageTitle)
            case .hobby:
                self.configureNavigationController(&self.hobbyNavigationController,
                                                   rootViewController: viewController,
                                                   tabTitle: HobbyConstants.tabBarItemTitle,
                                                   tabImageTitle: HobbyConstants.tabBarItemImageTitle)
            }
        }
    }
    
    func configureNavigationController(_ navigationController: inout UINavigationController,
                                       rootViewController: UIViewController,
                                       tabTitle: String,
                                       tabImageTitle: String) {
        navigationController = UINavigationController(rootViewController: rootViewController)
        TabConfigurator.congigureTab(of: rootViewController,
                                     withTitle: tabTitle,
                                     withImageTitle: tabImageTitle)

    }
    
    func getNavigationController(with tag: ModuleTag?) -> UINavigationController {
        guard let tag = tag else {
            return UINavigationController()
        }
        switch tag {
        case .info:
            return self.infoNavigationController
        case .developer:
            return self.developerNavigationController
        case .hobby:
            return self.hobbyNavigationController
        }
    }
}
