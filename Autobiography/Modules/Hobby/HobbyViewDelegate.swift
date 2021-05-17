//
//  HobbyViewDelegate.swift
//  Autobiography
//
//  Created by Никита Гусев on 17.05.2021.
//

import Foundation

protocol HobbyViewDelegate: class {
    func getAllHobbies() -> [Hobby]
    func showAlert(withTitle title: String, andMessage message: String)
    func descriptionButtonPressed(on hobbyCardView: HobbyCardView)
    func showNextHobbyButtonPressed()
    func favouriteTeamsButtonPressed()
}
