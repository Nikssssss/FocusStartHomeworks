//
//  HobbyViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 03.05.2021.
//

import UIKit

protocol HobbyViewControllerProtocol: class {
    func configureView()
    func showNextHobby()
    func showAlert(withTitle title: String, andMessage message: String)
    func showDescription(in hobbyCardView: HobbyCardViewProtocol)
}

class HobbyViewController: UIViewController {
    private var hobbyView: HobbyView?
    private var presenter: HobbyPresenterProtocol?
    
    func setPresenter(_ presenter: HobbyPresenterProtocol) {
        self.presenter = presenter
    }
    
    override func loadView() {
        super.loadView()
        
        let hobbyView = HobbyView()
        hobbyView.getAllHobbies = { [weak self] in
            return self?.presenter?.getAllHobbies()
        }
        hobbyView.nextHobbyButtonTapHandler = { [weak self] in
            self?.presenter?.showNextHobbyButtonPressed()
        }
        hobbyView.favouriteTeamsButtonHandler = { [weak self] in
            self?.presenter?.favouriteTeamsButtonPressed()
        }
        hobbyView.showAlertHandler = { [weak self] (title, message) in
            self?.presenter?.showAlertPressed(title: title, message: message)
        }
        hobbyView.descriptionButtonTapHandler = { [weak self] (hobbyCardView) in
            self?.presenter?.descriptionButtonPressed(in: hobbyCardView)
        }
        self.hobbyView = hobbyView
        self.view = hobbyView
        
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
}

extension HobbyViewController: HobbyViewControllerProtocol {
    func configureView() {
        self.setupView()
        self.hobbyView?.configureView()
    }
    
    func showNextHobby() {
        self.hobbyView?.showNextHobby()
    }
    
    func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: HobbyConstants.descriptionAlertControllerActionTitle, style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showDescription(in hobbyCardView: HobbyCardViewProtocol) {
        hobbyCardView.showDescription()
    }
}

private extension HobbyViewController {
    func setupView() {
        self.setupNavigationItem()
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = HobbyConstants.navigationItemTitle
    }
}
