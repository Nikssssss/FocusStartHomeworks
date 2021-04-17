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
    private var filters: [Body]?
    
    init(presenter: CarListPresenter, storageService: StorageService) {
        self.presenter = presenter
        self.storageService = storageService
    }
}

extension CarListInteractor: CarListInteractorProtocol {
    var filteredBodies: [Body]? {
        get {
            return self.filters
        }
        set {
            self.filters = newValue
        }
    }
    
    func addCar(_ car: Car) {
        self.storageService.addCar(car)
    }
    
    func getAllNeededCars() -> [Car]? {
        if let filters = self.filters {
            let allFilteredCars = self.storageService.getAllCars(with: filters)
            return allFilteredCars
        } else {
            let allCars = self.storageService.getAllCars()
            return allCars
        }
    }
}
