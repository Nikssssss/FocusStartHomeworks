//
//  CarFilterPresenter.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarFilterPresenter {
    weak var viewController: CarFilterViewControllerProtocol?
    var interactor: CarFilterInteractorProtocol!
    var router: CarFilterRouterProtocol!
    
    init(viewController: CarFilterViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension CarFilterPresenter: CarFilterPresenterProtocol {
    func configureView() {
        let bodies = self.interactor.getAllBodies()
        let filters = [CarFilterConstants.allBodyTypes] + bodies.map { (body) -> String in
            return body.rawValue
        }
        self.viewController?.configureView(using: filters)
    }
    
    func readyButtonPressed() {
        let selectedFilter = self.viewController?.getSelectedFilter()
        guard let filter = selectedFilter else {
            return
        }
        let selectedBody = Body.init(rawValue: filter)
        self.router.showCarListScene(using: selectedBody)
    }
}
