//
//  CarListInteractor.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListInteractor {
    let storageService: StorageServiceProtocol
    private var filter: Body?
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
}

extension CarListInteractor: CarListInteractorProtocol {
    var filteredBody: Body? {
        get {
            return self.filter
        }
        set {
            self.filter = newValue
        }
    }
    
    func addCar(_ car: Car) {
        self.storageService.addCar(car)
    }
    
    func getAllNeededCars() -> [Car]? {
        if let filter = self.filter {
            let allFilteredCars = self.storageService.getAllCars(with: filter)
            return allFilteredCars
        } else {
            let allCars = self.storageService.getAllCars()
            return allCars
        }
    }
}
