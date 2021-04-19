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
    private var filter: Body?
    
    init(presenter: CarListPresenter, storageService: StorageService) {
        self.presenter = presenter
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
