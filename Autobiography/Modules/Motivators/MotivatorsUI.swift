//
//  MotivatorsUI.swift
//  Autobiography
//
//  Created by Никита Гусев on 28.05.2021.
//

import Foundation
import UIKit

protocol MotivatorsUIProtocol: class {
    var backButtonTapHandler: (() -> Void)? { get set }
    var viewDidLoadHandler: (() -> Void)? { get set }
    var loadViewHandler: (() -> Void)? { get set }
    var sizeForItemAt: ((_ indexPath: IndexPath) -> CGSize)? { get set }
    var numberOfMotivators: (() -> Int)? { get set }
    var cellWillAppear: ((MotivatorsCellProtocol, IndexPath) -> Void)? { get set }
    var minimumInteritemSpacing: (() -> CGFloat)? { get set }
    var screenViewWidth: CGFloat { get }
    
    func replaceScreenView()
    func configureUI()
}

class MotivatorsUI: UIViewController {
    var presenter: MotivatorsPresenterProtocol?
    
    var backButtonTapHandler: (() -> Void)?
    var viewDidLoadHandler: (() -> Void)?
    var loadViewHandler: (() -> Void)?
    
    private let motivatorsView = MotivatorsView()
    
    override func loadView() {
        super.loadView()
        
        self.loadViewHandler?()
        
        Logger.logCallingMethod(of: MotivatorsUI.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewDidLoadHandler?()
        
        Logger.logCallingMethod(of: MotivatorsUI.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Logger.logCallingMethod(of: MotivatorsUI.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Logger.logCallingMethod(of: MotivatorsUI.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        Logger.logCallingMethod(of: MotivatorsUI.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        Logger.logCallingMethod(of: MotivatorsUI.self)
    }
    
    func setPresenter(_ presenter: MotivatorsPresenterProtocol) {
        self.presenter = presenter
    }
}

extension MotivatorsUI: MotivatorsUIProtocol {
    var sizeForItemAt: ((IndexPath) -> CGSize)? {
        set {
            self.motivatorsView.sizeForItemAt = newValue
        }
        get {
            return self.motivatorsView.sizeForItemAt
        }
    }
    var numberOfMotivators: (() -> Int)? {
        set {
            self.motivatorsView.numberOfMotivators = newValue
        }
        get {
            return self.motivatorsView.numberOfMotivators
        }
    }
    var cellWillAppear: ((MotivatorsCellProtocol, IndexPath) -> Void)? {
        set {
            self.motivatorsView.cellWillAppear = newValue
        }
        get {
            return self.motivatorsView.cellWillAppear
        }
    }
    var minimumInteritemSpacing: (() -> CGFloat)? {
        get {
            return self.motivatorsView.minimumInteritemSpacing
        }
        set {
            self.motivatorsView.minimumInteritemSpacing = newValue
        }
    }
    var screenViewWidth: CGFloat {
        return self.view.frame.width
    }
    
    func replaceScreenView() {
        self.view = self.motivatorsView
    }
    
    func configureUI() {
        self.setupView()
        self.motivatorsView.configureView()
    }
}

private extension MotivatorsUI {
    func setupView() {
        self.setupNavigationItem()
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = MotivatorsConstants.navigationItemTitle
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = MotivatorsConstants.backBarButtonItemTitle
        backBarButtonItem.target = self
        backBarButtonItem.action = #selector(self.backBarButtonPressed)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
    
    @objc func backBarButtonPressed() {
        self.backButtonTapHandler?()
    }
}
