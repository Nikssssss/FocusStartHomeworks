//
//  CarFilterInteractor.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarFilterInteractor {
}

extension CarFilterInteractor: CarFilterInteractorProtocol {
    func getAllBodies() -> [Body] {
        return Body.allCases
    }
}
