//
//  StorageService.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation
import RealmSwift

class StorageService {
    private var realm = try? Realm()
    
    func getAllCars() -> [Car]? {
        guard let cars = self.realm?.objects(CarObject.self) else {
            return nil
        }
        var allCars = [Car]()
        for car in cars {
            let body = Body.init(rawValue: car.body)!
            let yearOfIssue = car.yearOfIssue == -1 ? nil : car.yearOfIssue
            let carNumber = car.carNumber == "" ? nil : car.carNumber
            allCars.append(Car(manufacturer: car.manufacturer,
                                     model: car.model,
                                     body: body,
                                     yearOfIssue: yearOfIssue,
                                     carNumber: carNumber))
        }
        return allCars
    }
    
    func getAllCars(with carBody: Body) -> [Car]? {
        guard let cars = self.realm?.objects(CarObject.self) else {
            return nil
        }
        var allCars = [Car]()
        for car in cars {
            let body = Body.init(rawValue: car.body)!
            if carBody != body {
                continue
            }
            let yearOfIssue = car.yearOfIssue == -1 ? nil : car.yearOfIssue
            let carNumber = car.carNumber == "" ? nil : car.carNumber
            allCars.append(Car(manufacturer: car.manufacturer,
                                     model: car.model,
                                     body: body,
                                     yearOfIssue: yearOfIssue,
                                     carNumber: carNumber))
        }
        return allCars
    }
    
    func addCar(_ car: Car) {
        guard let realm = self.realm else {
            print("Error during getting Realm")
            return
        }
        do {
            try realm.write() {
                let addingCarObject = CarObject()
                addingCarObject.manufacturer = car.manufacturer
                addingCarObject.model = car.model
                addingCarObject.body = car.body.rawValue
                if let yearOfIssue = car.yearOfIssue {
                    addingCarObject.yearOfIssue = yearOfIssue
                }
                if let carNumber = car.carNumber {
                    addingCarObject.carNumber = carNumber
                }
                realm.add(addingCarObject)
            }
        } catch {
            print("Error during inserting a car")
            return
        }
    }
    
    deinit {
        if let realm = self.realm  {
            realm.invalidate()
        }
    }
}
