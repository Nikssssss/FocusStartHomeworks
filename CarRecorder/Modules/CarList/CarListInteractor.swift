//
//  CarListInteractor.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListInteractor {
    
    weak var presenter: CarListPresenterProtocol?
    let storageService: StorageService
    
    init(presenter: CarListPresenter, storageService: StorageService) {
        self.presenter = presenter
        self.storageService = storageService
    }
}

extension CarListInteractor: CarListInteractorProtocol {
    func addCar(_ car: Car) {
        self.storageService.addCar(car)
    }
    
    func getAllCars() -> [Car]? {
        let allCars = self.storageService.getAllCars()
        return allCars
    }
}
