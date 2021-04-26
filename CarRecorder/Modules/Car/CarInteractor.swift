//
//  CarInteractor.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarInteractor {
    
    weak var presenter: CarPresenterProtocol?
    let storageService: StorageService
    
    init(presenter: CarPresenter, storageService: StorageService) {
        self.presenter = presenter
        self.storageService = storageService
    }
}

extension CarInteractor: CarInteractorProtocol {
    func addCar(_ car: Car) {
        self.storageService.addCar(car)
    }
}
