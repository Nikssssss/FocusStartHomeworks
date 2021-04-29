//
//  CarObject.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import Foundation
import RealmSwift

class CarObject: Object {
    @objc dynamic var manufacturer = ""
    @objc dynamic var model = ""
    @objc dynamic var body = ""
    @objc dynamic var yearOfIssue = -1
    @objc dynamic var carNumber = ""
}
