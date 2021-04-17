//
//  CarListInteractorProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarListInteractorProtocol: class {
    func addCar(_ car: Car)
    func getAllCars() -> [Car]?
}
