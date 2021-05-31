//
//  ImagesAssembly.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation
import class UIKit.UIViewController

class ImagesAssembly {
    static func assemble() -> UIViewController {
        let imagesView = ImagesView()
        let imagesUI = ImagesUI(imagesView: imagesView)
        
        let imagesStorage = ImagesStorage()
        let networkManager = NetworkManager()
        let router = ImagesRouter(imagesUI: imagesUI)
        let presenter = ImagesPresenter(imagesUI: imagesUI,
                                        imagesStorage: imagesStorage,
                                        networkManager: networkManager,
                                        router: router)
        imagesUI.setPresenter(presenter)
        
        return imagesUI
    }
}
