//
//  ImagesRouter.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation
import class UIKit.UIAlertController
import class UIKit.UIAlertAction

protocol ImagesRouterProtocol: class {
    func showAlert(with message: String)
}

class ImagesRouter: ImagesRouterProtocol {
    private weak var imagesUI: ImagesUIProtocol?
    
    init(imagesUI: ImagesUIProtocol) {
        self.imagesUI = imagesUI
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: ImagesConstants.imageAlertTitle,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ImagesConstants.imageAlertOkActionTitle,
                                      style: .default,
                                      handler: nil))
        self.imagesUI?.viewController.present(alert, animated: true, completion: nil)
    }
}
