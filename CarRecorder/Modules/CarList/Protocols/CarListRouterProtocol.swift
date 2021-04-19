//
//  CarListRouterProtocol.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

protocol CarListRouterProtocol: class {
    func showCarScene()
    func showCarFilterScene(with completionHandler: @escaping (Body?) -> Void)
}
