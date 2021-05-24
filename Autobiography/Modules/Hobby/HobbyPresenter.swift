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
    func getAllHobbies() -> [HobbyViewInfo]
    func showAlertPressed(title: String, message: String)
    func descriptionButtonPressed(in hobbyCardView: HobbyCardViewProtocol)
}

class HobbyPresenter {
    weak var hobbyViewController: HobbyViewControllerProtocol?
    private let hobbyService: HobbyServiceProtocol
    private let navigator: Navigator
    
    init(hobbyViewController: HobbyViewControllerProtocol,
         hobbyService: HobbyServiceProtocol,
         navigator: Navigator) {
        self.hobbyViewController = hobbyViewController
        self.hobbyService = hobbyService
        self.navigator = navigator
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
        self.navigator.showTeamsScene()
    }
    
    func getAllHobbies() -> [HobbyViewInfo] {
        let hobbies = self.hobbyService.allHobbies
        let hobbyViewInfos = hobbies.map { (hobby: Hobby) -> HobbyViewInfo in
            return HobbyMapper.mapToHobbyViewInfo(hobby)
        }
        return hobbyViewInfos
    }
    
    func showAlertPressed(title: String, message: String) {
        self.hobbyViewController?.showAlert(withTitle: title, andMessage: message)
    }
    
    func descriptionButtonPressed(in hobbyCardView: HobbyCardViewProtocol) {
        self.hobbyViewController?.showDescription(in: hobbyCardView)
    }
}
