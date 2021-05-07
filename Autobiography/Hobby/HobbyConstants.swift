//
//  HobbyConstants.swift
//  Autobiography
//
//  Created by Никита Гусев on 07.05.2021.
//

import Foundation
import UIKit

struct HobbyConstants {
    //MARK: HobbyViewController
    
    static let navigationItemTitle = "Мои хобби"
    static let tabBarItemTitle = "Хобби"
    static let tabBarItemImage = UIImage(systemName: "wand.and.stars")
    static let nextHobbyButtonTitle = "Cледующее хобби"
    static let nextHobbyButtonCornerRadius: CGFloat = 12
    static let nextHobbyButtonTitleColor = UIColor.white
    static let nextHobbyButtonBackgroundColor = UIColor.blue
    static let nextHobbyButtonShadowOffset = CGSize(width: 4, height: 4)
    static let nextHobbyButtonShadowColor = UIColor.blue.cgColor
    static let nextHobbyButtonShadowRadius: CGFloat = 3
    static let nextHobbyButtonShadowOpacity: Float = 0.4
    static let hobbyViewBackgroundColor = UIColor.orange
    static let betweenViewOffset: CGFloat = 10
    
    //MARK: HobbyCardView
    
    static let initError = "init(coder:) has not been implemented"
    static let hobbyCardViewCornerRadius: CGFloat = 15
    static let hobbyCardViewShadowOffset = CGSize(width: 4, height: 4)
    static let hobbyCardViewShadowColor = UIColor.gray.cgColor
    static let hobbyCardViewShadowRadius: CGFloat = 2
    static let hobbyCardViewShadowOpacity: Float = 0.5
    static let hobbyTitleLabelTextColor = UIColor.white
    static let hobbyTitleLabelFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let showDescriptionButtonTitle = "Подробнее"
    static let showDescriptionButtonTitleFont = UIFont.systemFont(ofSize: 13, weight: .medium)
    static let showDescriptionButtonBackgroundColor = UIColor.purple
    static let showDescriptionButtonCornerRadius: CGFloat = 7
    static let showDescriptionButtonTitleColor = UIColor.white
    static let switchLabelText = "Всплывающее окно"
    static let switchLabelFont = UIFont.systemFont(ofSize: 10, weight: .medium)
    static let switchLabelTextColor = UIColor.white
    static let descriptionSwitchBackgroundColor = UIColor.lightGray
    static let descriptionSwitchCornerRadius: CGFloat = 16
    static let hobbyDescriptionLabelTextColor = UIColor.white
    static let hobbyDescriptionLabelFont = UIFont.systemFont(ofSize: 11, weight: .medium)
    static let descriptionAlertControllerTitle = "Подробнее"
    static let descriptionAlertControllerActionTitle = "Ок"
}
