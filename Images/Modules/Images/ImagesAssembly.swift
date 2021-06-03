//
//  ImagesAssembly.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation
import class UIKit.UIViewController

class ImagesAssembly {
    static func makeModule() -> UIViewController {
        let imagesUI = ImagesUI()
        
        let imagesStorage = ImagesStorage()
        let networkManager = NetworkManager()
        let navigator = Navigator.shared
        let presenter = ImagesPresenter(imagesUI: imagesUI,
                                        imagesStorage: imagesStorage,
                                        networkManager: networkManager,
                                        navigator: navigator)
        imagesUI.setPresenter(presenter)
        
        return imagesUI
    }
}
