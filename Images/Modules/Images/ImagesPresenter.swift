//
//  ImagesPresenter.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import Foundation
import struct CoreGraphics.CGFloat

protocol ImagesPresenterProtocol: class {
    func loadView()
    func viewDidLoad()
}

class ImagesPresenter: ImagesPresenterProtocol {
    private weak var imagesUI: ImagesUIProtocol?
    private let imagesStorage: ImagesStorageProtocol
    private let networkManager: NetworkManagerProtocol
    private let router: ImagesRouterProtocol
    
    init(imagesUI: ImagesUIProtocol,
         imagesStorage: ImagesStorageProtocol,
         networkManager: NetworkManagerProtocol,
         router: ImagesRouterProtocol) {
        self.imagesUI = imagesUI
        self.imagesStorage = imagesStorage
        self.networkManager = networkManager
        self.router = router
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
            if let self = self,
               indexPath.row >= 0,
               indexPath.row < self.imagesStorage.numberOfImages {
                return ImagesConstants.imageTableCellRowHeight
            } else {
                return 0
            }
        }
    }
    
    func configureNumberOfRowsHandler() {
        self.imagesUI?.numberOfRowsHandler = { [weak self] in
            return self?.imagesStorage.numberOfImages ?? 0
        }
    }
    
    func configureCellWillAppearHandler() {
        self.imagesUI?.cellWillAppearHandler = { [weak self] cell, indexPath in
            guard let self = self,
                  indexPath.row >= 0,
                  indexPath.row < self.imagesStorage.numberOfImages,
                  let image = self.imagesStorage.getImage(at: indexPath.row)
            else {
                return
            }
            cell.setImage(image.image)
        }
    }
    
    func configureSearchButtonTapHandler() {
        self.imagesUI?.searchButtonTapHanlder = { [weak self] urlString in
            guard let self = self, let urlString = urlString else { return }
            self.networkManager.loadImage(with: urlString) { result in
                switch result {
                case .failure(let error):
                    self.router.showAlert(with: error.message)
                case .success(let image):
                    self.imagesStorage.addImage(image)
                    self.imagesUI?.reloadImages()
                }
            }
        }
    }
}

