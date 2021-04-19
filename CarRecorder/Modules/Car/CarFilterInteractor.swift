//
//  CarFilterInteractor.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarFilterInteractor {
    weak var presenter: CarFilterPresenterProtocol?
    
    init(presenter: CarFilterPresenter) {
        self.presenter = presenter
    }
}

extension CarFilterInteractor: CarFilterInteractorProtocol {
    func getAllBodies() -> [Body] {
        return Body.allCases
    }
}
