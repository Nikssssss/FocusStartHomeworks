//
//  TeamsConstants.swift
//  Autobiography
//
//  Created by Никита Гусев on 10.05.2021.
//

import Foundation
import UIKit

struct TeamsConstants {
    //MARK: TeamsViewController
    
    static let teamsCellHeight: CGFloat = 80
    static let interPlayersSpace = "  "
    static let navigationItemTitle = "Любимые команды"
    
    //MARK: TeamTableViewCell
    
    static let cellIdentifier = "TeamTableViewCell"
    static let initError = "init(coder:) has not been implemented"
    static let teamNamelLabelFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    static let teamNameLabelTextColor = UIColor.orange
    static let teamRosterLabelfont = UIFont.systemFont(ofSize: 13, weight: .light)
    static let teamRosterLabelTextColor = UIColor.gray
}
