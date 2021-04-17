//
//  CarRouter.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarRouter {
    
    weak var viewController: CarViewControllerProtocol?
    
    init(viewController: CarViewController) {
        self.viewController = viewController
    }
}

extension CarRouter: CarRouterProtocol {
    
}
