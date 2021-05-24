//
//  SceneDelegate.swift
//  Autobiography
//
//  Created by Никита Гусев on 01.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigator = Navigator.shared
        navigator.start()
        guard let rootViewController = navigator.getMainController() else {
            return
        }
        window.rootViewController = rootViewController.viewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

