//
//  TabConfigurator.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import Foundation
import UIKit

class TabConfigurator {
    static func congigureTab(of viewController: UIViewController,
                             withTitle title: String,
                             withImageTitle imageTitle: String) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(systemName: imageTitle)
    }
}
