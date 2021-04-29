//
//  CarViewControllerProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarViewControllerProtocol: class {
    var manufacturer: String { get }
    var model: String { get }
    var body: String { get }
    var yearOfIssue: String? { get }
    var carNumber: String? { get }
    func configureView()
    func hasBlankRequiredFields() -> Bool
    func showErrorMessage(_ errorMessage: String)
    func clearAllFields()
}
