//
//  CarFilterAssembly.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarFilterAssembly {
    
    static func assemble() -> CarFilterViewController {
        let viewController = CarFilterViewController()
        let presenter = CarFilterPresenter(viewController: viewController)
        let router = CarFilterRouter(viewController: viewController)
        
        let interactor = CarFilterInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
    
}
