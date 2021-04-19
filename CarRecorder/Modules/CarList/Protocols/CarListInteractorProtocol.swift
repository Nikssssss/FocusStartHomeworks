//
//  CarListInteractorProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarListInteractorProtocol: class {
    var filteredBody: Body? { get set }
    func addCar(_ car: Car)
    func getAllNeededCars() -> [Car]?
}
