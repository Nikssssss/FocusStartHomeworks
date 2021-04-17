//
//  CarListPresenter.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarListPresenter {
    
    weak var viewController: CarListViewControllerProtocol?
    var interactor: CarListInteractorProtocol!
    var router: CarListRouterProtocol!
    
    init(viewController: CarListViewController) {
        self.viewController = viewController
    }
}

extension CarListPresenter: CarListPresenterProtocol {
    func configureView() {
//        self.interactor.addCar(Car(manufacturer: "Nissan",
//                                   model: "Bluebird",
//                                   body: .sedan, yearOfIssue: 1999,
//                                   carNumber: "н547уо154"))
//        self.interactor.addCar(Car(manufacturer: "Honda",
//                                   model: "CR-V",
//                                   body: .suv,
//                                   yearOfIssue: nil,
//                                   carNumber: "н123ка154"))
        let allCars = self.interactor.getAllCars()
        self.viewController?.configureView(using: allCars)
    }
}
