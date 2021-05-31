//
//  ImagesStorage.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation

protocol ImagesStorageProtocol: class {
    var numberOfImages: Int { get }
    
    func addImage(_ image: Image)
    func getImage(at index: Int) -> Image?
}

class ImagesStorage: ImagesStorageProtocol {
    var numberOfImages: Int {
        return self.images.count
    }
    
    private var images = [Image]()
    
    func addImage(_ image: Image) {
        self.images.append(image)
    }
    
    func getImage(at index: Int) -> Image? {
        guard index >= 0 && index < self.images.count else {
            return nil
        }
        return self.images[index]
    }
}
