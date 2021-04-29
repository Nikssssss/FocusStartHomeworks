//
//  CarListConstants.swift
//  CarRecorder
//
//  Created by Никита Гусев on 19.04.2021.
//

import Foundation
import UIKit

struct CarListConstants {
    //MARK: CarListViewController
    
    static let defaultYearOfIssue = "-"
    static let carTableCellHeight: CGFloat = 135
    static let addCarButtonTitle = "Добавить"
    static let filterButtonTitle = "Фильтры"
    static let navigationItemTitle = "Список машин"
    
    //MARK: CarTableViewCell
    
    static let carTableCellIdentifier = "CarTableViewCell"
    static let initError = "init(coder:) has not been implemented"
    static let manufactureTemplateText = "Производитель: "
    static let modelTemplateText = "Модель: "
    static let bodyTemplateText = "Тип кузова: "
    static let yearOfIssueTemplateText = "Год выпуска: "
    static let mainLabelFont = UIFont.systemFont(ofSize: 18, weight: .bold)
    static let mainLabelTextColor = UIColor.orange
    static let additionalLabelFont = UIFont.systemFont(ofSize: 13, weight: .light)
    static let additionalLabelTextColor = UIColor.darkGray
    static let cellBorderColor = UIColor.gray.cgColor
    static let cellBorderWidth: CGFloat = 0.4
    static let cellBorderCornerRadius: CGFloat = 10
    static let cellInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
}
