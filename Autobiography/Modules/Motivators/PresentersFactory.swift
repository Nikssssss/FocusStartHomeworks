//
//  PresentersFactory.swift
//  Autobiography
//
//  Created by Никита Гусев on 22.05.2021.
//

import Foundation

class MotivatorsCellPresenter: CellPresenter {
    var numberOfItems: Int {
        return self.motivatorsService.numberOfMotivators
    }
    
    private let motivatorsService = MotivatorsService()
    
    func cellDidLoad(cell: MotivatorCollectionViewCellProtocol, row: Int) {
        guard let motivator = self.motivatorsService.getMotivator(at: row) else { return }
        cell.configureUI(using: MotivatorViewModel(name: motivator.name, imageUrl: motivator.imageUrl))
    }
}

//--------------------------------------------------------------------------------------------

protocol CellPresenter {
    var numberOfItems: Int { get }
    func cellDidLoad(cell: MotivatorCollectionViewCellProtocol, row: Int)
}

protocol PresentersFactory: AnyObject {
    func createCellPresenter() -> CellPresenter
}

//--------------------------------------------------------------------------------------------

class MotivatorPresenterFactory: PresentersFactory {
    func createCellPresenter() -> CellPresenter {
        return MotivatorsCellPresenter()
    }
}

//--------------------------------------------------------------------------------------------

class PresenterFactoryCreator {
    static func getPresentersFactory(for row: Int) -> PresentersFactory {
        return MotivatorPresenterFactory()
    }
}
