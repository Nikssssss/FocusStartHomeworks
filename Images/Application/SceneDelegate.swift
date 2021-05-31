//
//  SceneDelegate.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import UIKit
import Alamofire

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
//    var urlSession: URLSession?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ImagesAssembly.assemble()
        window.makeKeyAndVisible()
        self.window = window
    }
    
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        let configuration = URLSessionConfiguration.background(withIdentifier: "com.my.app")
//        configuration.isDiscretionary = true
//        configuration.allowsCellularAccess = true
//        configuration.shouldUseExtendedBackgroundIdleMode = true
//        configuration.waitsForConnectivity = true
//
//        self.urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
//        AF.session.getAllTasks { [weak self] tasks in
//            tasks.forEach { task in
//                guard let request = task.originalRequest else { return }
//                task.cancel()
//                self?.urlSession?.dataTask(with: request).resume()
//            }
//        }
//    }
}

//extension SceneDelegate: URLSessionDataDelegate {
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        print(data)
//    }
//
//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        print("didCompleteWithError")
//    }
//}
