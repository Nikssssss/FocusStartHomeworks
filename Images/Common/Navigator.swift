//
//  Navigator.swift
//  Images
//
//  Created by Никита Гусев on 04.06.2021.
//

import Foundation
import UIKit

final class Navigator {
    static var shared: Navigator = {
        let navigator = Navigator()
        return navigator
    }()
    
    private var mainViewController: UIViewController?
    
    private init() {}
    
    func start() -> UIViewController {
        let imagesViewController = ImagesAssembly.makeModule()
        self.mainViewController = imagesViewController
        return imagesViewController
    }
    
    func showAlert(with message: String) {
        let alert = UIAlertController(title: ImagesConstants.imageAlertTitle,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ImagesConstants.imageAlertOkActionTitle,
                                      style: .default,
                                      handler: nil))
        self.mainViewController?.present(alert, animated: true, completion: nil)
    }
}
