//
//  MotivatorsPresenter.swift
//  Autobiography
//
//  Created by Никита Гусев on 28.05.2021.
//

import Foundation
import struct CoreGraphics.CGSize

protocol MotivatorsPresenterProtocol: class {
    func configureUI()
}

class MotivatorsPresenter: MotivatorsPresenterProtocol {
    private weak var motivatorsUI: MotivatorsUIProtocol?
    private let motivatorsService: MotivatorsServiceProtocol
    private let navigator: Navigator
    private let motivatorsCellPresenter: MotivatorsCellPresenterProtocol
    
    init(motivatorsUI: MotivatorsUIProtocol,
         motivatorsService: MotivatorsServiceProtocol,
         navigator: Navigator,
         motivatorsCellPresenter: MotivatorsCellPresenterProtocol) {
        self.motivatorsUI = motivatorsUI
        self.motivatorsService = motivatorsService
        self.navigator = navigator
        self.motivatorsCellPresenter = motivatorsCellPresenter
    }
    
    func configureUI() {
        self.configureLoadViewHandler()
        self.configureViewDidLoadHandler()
        self.configureBackButtonTapHandler()
        self.configureSizeForItemHandler()
        self.configureNumberOfMotivatorsHandler()
        self.configureCellWillAppearHandler()
        self.configureMinimumInteritemSpacingHandler()
    }
}

private extension MotivatorsPresenter {
    func configureLoadViewHandler() {
        self.motivatorsUI?.loadViewHandler = { [weak self] in
            self?.motivatorsUI?.replaceScreenView()
        }
    }
    
    func configureViewDidLoadHandler() {
        self.motivatorsUI?.viewDidLoadHandler = { [weak self] in
            guard let self = self else { return }
            self.motivatorsService.initializeMotivators()
            self.motivatorsUI?.configureUI()
        }
    }
    
    func configureBackButtonTapHandler() {
        self.motivatorsUI?.backButtonTapHandler = { [weak self] in
            guard let self = self, let viewController = self.motivatorsUI?.viewController else {
                return
            }
            let navigationItem = ModuleNavigationItem(viewController: viewController, moduleTag: .developer)
            self.navigator.hideScene(navigationItem)
        }
    }
    
    func configureSizeForItemHandler() {
        self.motivatorsUI?.sizeForItemAt = { [weak self] (indexPath) -> CGSize in
            guard let self = self, let motivatorsUI = self.motivatorsUI else { return .zero}
            let viewWidth = motivatorsUI.viewController.view.frame.width
            return self.motivatorsCellPresenter.sizeForItem(at: indexPath, viewWidth: viewWidth)
        }
    }
    
    func configureNumberOfMotivatorsHandler() {
        self.motivatorsUI?.numberOfMotivators = { [weak self] in
            return self?.motivatorsService.numberOfMotivators ?? 0
        }
    }
    
    func configureCellWillAppearHandler() {
        self.motivatorsUI?.cellWillAppear = { [weak self] (cell, indexPath) in
            self?.motivatorsCellPresenter.cellWillAppear(cell: cell, indexPath: indexPath)
        }
    }
    
    func configureMinimumInteritemSpacingHandler() {
        self.motivatorsUI?.minimumInteritemSpacing = {
            return self.motivatorsCellPresenter.minimumInteritemSpacing
        }
    }
}
