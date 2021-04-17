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
        self.viewController?.navigationController?.present(carNavigationController, animated: true)
    }
}
