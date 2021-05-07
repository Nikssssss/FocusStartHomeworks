//
//  CarInteractor.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarInteractor {
    let storageService: StorageServiceProtocol
    
    init(storageService: StorageServiceProtocol) {
        self.storageService = storageService
    }
}

extension CarInteractor: CarInteractorProtocol {
    func addCar(_ car: Car) {
        self.storageService.addCar(car)
    }
    
    func getAllBodies() -> [Body] {
        return Body.allCases
    }
}
