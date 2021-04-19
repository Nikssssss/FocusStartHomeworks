//
//  CarFilterViewControllerProtocol.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarFilterViewControllerProtocol: class {
    func configureView(using bodyFilters: [String])
    func getSelectedFilter() -> String?
}
