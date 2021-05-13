//
//  CarPresenterProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarPresenterProtocol: class {
    func configureView()
    func cancelButtonPressed()
    func addCarButtonPressed()
    func getAllBodies() -> [Body]
}
