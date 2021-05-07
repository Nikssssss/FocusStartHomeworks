//
//  CarListPresenter.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListPresenter {
    weak var viewController: CarListViewControllerProtocol?
    var interactor: CarListInteractorProtocol!
    var router: CarListRouterProtocol!
    
    init(viewController: CarListViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension CarListPresenter: CarListPresenterProtocol {
    func configureView() {
        let allCars = self.interactor.getAllNeededCars()
        self.viewController?.configureView(using: allCars)
    }
    
    func addCarButtonPressed() {
        self.router.showCarScene()
    }
    
    func filterButtonPressed() {
        self.router.showCarFilterScene() { [weak self] body in
            self?.interactor.filteredBody = body
        }
    }
    
    func viewWillAppear() {
        let cars = self.interactor.getAllNeededCars()
        self.viewController?.updateCars(to: cars)
    }
}
