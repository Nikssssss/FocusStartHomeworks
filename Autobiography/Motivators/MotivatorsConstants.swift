//
//  MotivatorsConstants.swift
//  Autobiography
//
//  Created by Никита Гусев on 10.05.2021.
//

import Foundation
import UIKit

struct MotivatorsConstants {
    //MARK: MotivatorsViewController
    
    static let collectionViewInterItemOffset: Double = 10
    static let collectionViewLeftOffset: Double = 10
    static let collectionViewRightOffset: Double = 10
    static let navigationItemTitle = "Мотиваторы"
    static let backBarButtonItemTitle = "Назад"
    static let collectionViewBackgroundColor = UIColor.white
    
    //MARK: MotivatorCollectionViewCell
    
    static let cellIdentifier = "MotivatorCollectionViewCell"
    static let initError = "init(coder:) has not been implemented"
    static let contentViewBackgroundColor = UIColor.black
    static let contentViewCornerRadius: CGFloat = 15
    static let nameLabelFont = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let nameLabelTextColor = UIColor.white
    static let nameLabelMinimulScaleFactor: CGFloat = 0.8
}
