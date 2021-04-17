//
//  CarListRouter.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListRouter {
    
    weak var viewController: CarListViewControllerProtocol?
    
    init(viewController: CarListViewController) {
        self.viewController = viewController
    }
}

extension CarListRouter: CarListRouterProtocol {
    
}
