//
//  ImagesPresenter.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation
import struct CoreGraphics.CGFloat
import class UIKit.UIImage

protocol ImagesPresenterProtocol: class {
    func loadView()
    func viewDidLoad()
}

class ImagesPresenter: ImagesPresenterProtocol {
    private weak var imagesUI: ImagesUIProtocol?
    private let imagesStorage: ImagesStorageProtocol
    private let networkManager: NetworkManagerProtocol
    private let navigator: Navigator
    
    init(imagesUI: ImagesUIProtocol,
         imagesStorage: ImagesStorageProtocol,
         networkManager: NetworkManagerProtocol,
         navigator: Navigator) {
        self.imagesUI = imagesUI
        self.imagesStorage = imagesStorage
        self.networkManager = networkManager
        self.navigator = navigator
    }
    
    func loadView() {
        self.imagesUI?.replaceScreenView()
    }
    
    func viewDidLoad() {
        self.configureUI()
    }
}

private extension ImagesPresenter {
    func configureUI() {
        self.imagesUI?.configureUI()
        self.configureHeightForRowHanlder()
        self.configureNumberOfRowsHandler()
        self.configureCellWillAppearHandler()
        self.configureSearchButtonTapHandler()
    }
    
    func configureHeightForRowHanlder() {
        self.imagesUI?.heightForRowHandler = { [weak self] indexPath -> CGFloat in
            return self?.getHeightForRow(at: indexPath) ?? 0
        }
    }
    
    func configureNumberOfRowsHandler() {
        self.imagesUI?.numberOfRowsHandler = { [weak self] in
            return self?.getNumberOfRows() ?? 0
        }
    }
    
    func configureCellWillAppearHandler() {
        self.imagesUI?.cellWillAppearHandler = { [weak self] cell, indexPath in
            self?.configureCell(cell, at: indexPath)
        }
    }
    
    func configureSearchButtonTapHandler() {
        self.imagesUI?.searchButtonTapHanlder = { [weak self] urlString in
            self?.loadImage(from: urlString)
        }
    }
    
    func getHeightForRow(at indexPath: IndexPath) -> CGFloat {
        if indexPath.row >= 0,
           indexPath.row < self.imagesStorage.numberOfImages {
            return ImagesConstants.imageTableCellRowHeight
        } else {
            return 0
        }
    }
    
    func getNumberOfRows() -> Int {
        return self.imagesStorage.numberOfImages
    }
    
    func configureCell(_ cell: ImageTableCellProtocol, at indexPath: IndexPath) {
        guard indexPath.row >= 0,
              indexPath.row < self.imagesStorage.numberOfImages,
              let image = self.imagesStorage.getImage(at: indexPath.row),
              let uiImage = self.mapToUIImage(image: image)
        else {
            return
        }
        cell.setImage(uiImage)
    }
    
    func loadImage(from urlString: String?) {
        guard let urlString = urlString else { return }
        self.networkManager.loadImage(with: urlString) { result in
            switch result {
            case .failure(let error):
                self.navigator.showAlert(with: error.message)
            case .success(let image):
                guard self.canMapToUIImage(image: image) else {
                    self.navigator.showAlert(with: ImagesConstants.noImageDataErrorMessage)
                    return
                }
                self.imagesStorage.addImage(image)
                self.imagesUI?.reloadImages()
            }
        }
    }
    
    func mapToUIImage(image: Image) -> UIImage? {
        return UIImage(data: image.imageData)
    }
    
    func canMapToUIImage(image: Image) -> Bool {
        return (UIImage(data: image.imageData) == nil ? false : true)
    }
}

