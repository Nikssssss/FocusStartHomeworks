//
//  CarInteractorProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarInteractorProtocol: class {
    func addCar(_ car: Car)
    func getAllBodies() -> [Body]
}
