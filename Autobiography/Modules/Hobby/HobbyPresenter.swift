//
//  HobbyPresenter.swift
//  Autobiography
//
//  Created by Никита Гусев on 15.05.2021.
//

import Foundation

protocol HobbyPresenterProtocol: class {
    func viewDidLoad()
    func showNextHobbyButtonPressed()
    func favouriteTeamsButtonPressed()
    func getAllHobbies() -> [Hobby]
    func showAlertPressed(title: String, message: String)
    func descriptionButtonPressed(in hobbyCardView: HobbyCardViewProtocol)
}

class HobbyPresenter {
    weak var hobbyViewController: HobbyViewControllerProtocol?
    private let hobbyService: HobbyServiceProtocol = HobbyService()
    private let router: Router = Router()
    
    init(hobbyViewController: HobbyViewControllerProtocol) {
        self.hobbyViewController = hobbyViewController
    }
}

extension HobbyPresenter: HobbyPresenterProtocol {
    func viewDidLoad() {
        self.hobbyService.initializeHobbies()
        self.hobbyViewController?.configureView()
    }

    func showNextHobbyButtonPressed() {
        self.hobbyViewController?.showNextHobby()
    }

    func favouriteTeamsButtonPressed() {
        guard let hobbyViewController = self.hobbyViewController?.viewController else { return }
        self.router.showTeamsScene(from: hobbyViewController)
    }
    
    func getAllHobbies() -> [Hobby] {
        return self.hobbyService.allHobbies
    }
    
    func showAlertPressed(title: String, message: String) {
        self.hobbyViewController?.showAlert(withTitle: title, andMessage: message)
    }
    
    func descriptionButtonPressed(in hobbyCardView: HobbyCardViewProtocol) {
        self.hobbyViewController?.showDescription(in: hobbyCardView)
    }
}
