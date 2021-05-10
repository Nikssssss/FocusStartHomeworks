//
//  Logger.swift
//  Autobiography
//
//  Created by Никита Гусев on 10.05.2021.
//

import Foundation
import UIKit

class Logger {
    static func logCallingMethod(of someClass: AnyClass, method: String = #function) {
        print("\(someClass): \(method)")
    }
}
