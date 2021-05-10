//
//  Router.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import Foundation
import UIKit

class Router {
    private let mainTabBarController = UITabBarController()
    
    func getMainController() -> UIViewController {
        let storyboardName = "Main"
        let infoViewControllerIdentifier = "InfoViewController"
        let infoViewControllerTabImageTitle = "info.circle"
        let infoViewControllerTabTitle = "Инфо"
        
        let sroryBoard = UIStoryboard(name: storyboardName, bundle: nil)
        let infoViewContoller = sroryBoard.instantiateViewController(withIdentifier: infoViewControllerIdentifier)
        let infoNavigationController = UINavigationController(rootViewController: infoViewContoller)
        TabConfigurator.congigureTab(of: infoViewContoller,
                                     withTitle: infoViewControllerTabTitle,
                                     withImageTitle: infoViewControllerTabImageTitle)
        
        let developerViewController = DeveloperViewController()
        let developerNavigationController = UINavigationController(rootViewController: developerViewController)
        TabConfigurator.congigureTab(of: developerViewController,
                                     withTitle: DeveloperConstants.tabBarItemTitle,
                                     withImageTitle: DeveloperConstants.tabBarItemImageTitle)
        
        
        let hobbyViewController = HobbyViewController()
        let hobbyNavigationController = UINavigationController(rootViewController: hobbyViewController)
        TabConfigurator.congigureTab(of: hobbyViewController,
                                     withTitle: HobbyConstants.tabBarItemTitle,
                                     withImageTitle: HobbyConstants.tabBarItemImageTitle)
        
        self.mainTabBarController.setViewControllers([infoNavigationController,
                                                      developerNavigationController,
                                                      hobbyNavigationController],
                                                     animated: false)
        return self.mainTabBarController
    }
    
    func showTeamsScene(from viewController: UIViewController) {
        let teamsViewController = TeamsViewController()
        viewController.navigationController?.pushViewController(teamsViewController, animated: true)
    }
    
    func showMotivatorsScene(from viewController: UIViewController) {
        let motivatorsViewController = MotivatorsViewController()
        let motivatorsNavigationController = UINavigationController(rootViewController: motivatorsViewController)
        viewController.navigationController?.present(motivatorsNavigationController, animated: true)
    }

    func dismissViewController(_ viewController: UIViewController) {
        viewController.dismiss(animated: true)
    }
}
