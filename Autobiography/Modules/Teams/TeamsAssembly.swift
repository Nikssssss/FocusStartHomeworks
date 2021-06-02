//
//  TeamsAssembly.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class TeamsAssembly {
    static func assemble() -> ModuleNavigationItemProtocol {
        let viewController = TeamsViewController()
        let navigationItem = ModuleNavigationItem(viewController: viewController, moduleTag: .hobby)
        return navigationItem
    }
}
