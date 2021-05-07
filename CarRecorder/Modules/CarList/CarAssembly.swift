//
//  CarAssembly.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarAssembly {
    static func assemble() -> CarViewController {
        let viewController = CarViewController()
        let presenter = CarPresenter(viewController: viewController)
        let router = CarRouter(viewController: viewController)
        
        let storageService = StorageService()
        let interactor = CarInteractor(storageService: storageService)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
