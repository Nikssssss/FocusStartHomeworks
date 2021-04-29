//
//  CarFilterRouter.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarFilterRouter {
    weak var viewController: CarFilterViewController?
    
    init(viewController: CarFilterViewController) {
        self.viewController = viewController
    }
}

extension CarFilterRouter: CarFilterRouterProtocol {
    func showCarListScene(using body: Body?) {
        self.viewController?.completionHandler(body)
        self.viewController?.navigationController?.dismiss(animated: true)
    }
}
