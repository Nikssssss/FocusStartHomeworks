//
//  CarPresenter.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation

class CarPresenter {
    
    weak var viewController: CarViewControllerProtocol?
    var interactor: CarInteractorProtocol!
    var router: CarRouterProtocol!
    
    init(viewController: CarViewController) {
        self.viewController = viewController
    }
}

extension CarPresenter: CarPresenterProtocol {
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
        self.viewController?.configureView()
    }
}
