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
    
    init(viewController: CarViewControllerProtocol) {
        self.viewController = viewController
    }
}

extension CarPresenter: CarPresenterProtocol {
    func configureView() {
        self.viewController?.configureView()
    }
    
    func cancelButtonPressed() {
        self.router.showCarListScene()
    }
    
    func addCarButtonPressed() {
        guard let viewController = self.viewController else {
            return
        }
        guard viewController.hasBlankRequiredFields() == false else {
            viewController.showErrorMessage(CarConstants.fillInAllRequiredFieldsError)
            return
        }
        
        var yearNumber: Int?
        if let yearOfIssue = viewController.yearOfIssue, yearOfIssue.isEmpty == false {
            yearNumber = Int(yearOfIssue)
            guard let yearNumber = yearNumber, yearNumber > CarConstants.minimalCarYearOfIssue else {
                viewController.showErrorMessage(CarConstants.enterCorrectYearError)
                return
            }
        }
        let body = Body.init(rawValue: viewController.body) ?? Body.sedan
        let car = Car(manufacturer: viewController.manufacturer,
                      model: viewController.model,
                      body: body,
                      yearOfIssue: yearNumber,
                      carNumber: viewController.carNumber)
        self.interactor.addCar(car)
        viewController.clearAllFields()
    }
    
    func getAllBodies() -> [Body] {
        return self.interactor.getAllBodies()
    }
}
