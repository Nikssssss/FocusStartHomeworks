//
//  NetworkManager.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol: class {
    func loadImage(with url: String, completion: @escaping (Result<Image, NetworkError>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    func loadImage(with url: String, completion: @escaping (Result<Image, NetworkError>) -> Void) {
        guard let imageUrl = URL(string: url) else {
            completion(.failure(NetworkError(message: ImagesConstants.invalidUrlErrorMessage)))
            return
        }
        AF.request(imageUrl).responseData { responseData in
            guard let imageData = responseData.data else {
                completion(.failure(NetworkError(message: ImagesConstants.noImageDataErrorMessage)))
                return
            }
            completion(.success(Image(imageData: imageData)))
        }
    }
}
