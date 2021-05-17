//
//  HobbyViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 03.05.2021.
//

import UIKit

protocol HobbyViewControllerProtocol: class {
    var viewController: UIViewController { get }
    func configureView()
    func showNextHobby()
    func showAlert(withTitle title: String, andMessage message: String)
    func showDescription(in hobbyCardView: HobbyCardViewProtocol)
}

class HobbyViewController: UIViewController {
    private var hobbyView: HobbyViewProtocol?
    
    private var presenter: HobbyPresenterProtocol?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.presenter = HobbyPresenter(hobbyViewController: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError(HobbyConstants.initError)
    }
    
    override func loadView() {
        super.loadView()
        
        let hobbyView: HobbyViewProtocol = HobbyView()
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
        self.view = hobbyView.view
        
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
}

extension HobbyViewController: HobbyViewControllerProtocol {
    var viewController: UIViewController {
        return self
    }
    
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
