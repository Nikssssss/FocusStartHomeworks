//
//  CarListRouter.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListRouter {
    
    weak var viewController: CarListViewController?
    
    init(viewController: CarListViewController) {
        self.viewController = viewController
    }
}

extension CarListRouter: CarListRouterProtocol {
    func showCarScene() {
        let carViewController = CarAssembly.assemble()
        let carNavigationController = carViewController.embeddedInNavigationController
        carNavigationController.modalPresentationStyle = .fullScreen
        self.viewController?.navigationController?.present(carNavigationController, animated: true)
    }
    
    func showCarFilterScene(with completionHandler: @escaping (Body?) -> Void) {
        let carFilterViewController = CarFilterAssembly.assemble()
        carFilterViewController.completionHandler = completionHandler
        let carFilterNavigationController = carFilterViewController.embeddedInNavigationController
        carFilterNavigationController.modalPresentationStyle = .fullScreen
        self.viewController?.navigationController?.present(carFilterNavigationController, animated: true)
    }
}
