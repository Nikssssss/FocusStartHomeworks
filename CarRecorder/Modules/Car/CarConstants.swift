//
//  CarConstants.swift
//  CarRecorder
//
//  Created by Никита Гусев on 19.04.2021.
//

import Foundation
import UIKit

struct CarConstants {
    //MARK: CarViewController
    
    static let emptyText = ""
    static let alertTitle = "Ошибка"
    static let alertOkTitle = "Ок"
    static let manufactureLabelText = "Производитель *"
    static let modelLabelText = "Модель *"
    static let bodyLabelText = "Тип кузова *"
    static let yearOfIssueLabelText = "Год выпуска"
    static let carNumberLabelText = "Гос. номер"
    static let cancelButtonTitle = "Отменить"
    static let navigationItemTitle = "Добавление машины"
    static let textFieldBackgroundColor = UIColor(red: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 1.0)
    static let textFieldCornerRadius: CGFloat = 5
    static let doneButtonTitle = "Готово"
    static let addCarButtonTitle = "Добавить"
    static let addCarButtonCornerRadius: CGFloat = 10
    static let addCarButtonBorderWidth: CGFloat = 0.5
    
    //MARK: CarPresenter
    
    static let fillInAllRequiredFieldsError = "Заполните все обязательные поля"
    static let enterCorrectYearError = "Введите корректное значение года выпуска"
    static let minimalCarYearOfIssue = 1886
}
