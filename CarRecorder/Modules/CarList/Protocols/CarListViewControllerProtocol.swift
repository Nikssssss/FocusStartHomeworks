//
//  CarListViewControllerProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarListViewControllerProtocol: class {
    func configureView(using cars: [Car]?)
}
