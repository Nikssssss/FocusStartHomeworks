//
//  CarListAssembly.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListAssembly {
    
    static func assemble() -> CarListViewController {
        let viewController = CarListViewController()
        let presenter = CarListPresenter(viewController: viewController)
        let router = CarListRouter(viewController: viewController)
        
        let storageService = StorageService()
        let interactor = CarListInteractor(presenter: presenter, storageService: storageService)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
    
}
