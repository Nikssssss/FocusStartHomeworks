//
//  StorageServiceProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 07.05.2021.
//

import Foundation

protocol StorageServiceProtocol: class {
    func getAllCars() -> [Car]?
    func getAllCars(with carBody: Body) -> [Car]?
    func addCar(_ car: Car)
}
