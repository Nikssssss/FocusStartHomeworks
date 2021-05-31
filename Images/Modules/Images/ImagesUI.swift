//
//  ViewController.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import UIKit

protocol ImagesUIProtocol: class {
    var viewController: UIViewController { get }
    var heightForRowHandler: ((_ indexPath: IndexPath) -> CGFloat)? { get set }
    var numberOfRowsHandler: (() -> Int)? { get set }
    var cellWillAppearHandler: ((ImageTableCellProtocol, IndexPath) -> Void)? { get set }
    var searchButtonTapHanlder: ((String?) -> Void)? { get set }
    
    func replaceScreenView()
    func reloadImages()
    func configureUI()
}

class ImagesUI: UIViewController {
    private let imagesView: ImagesViewProtocol
    private var presenter: ImagesPresenterProtocol?
    
    init(imagesView: ImagesViewProtocol) {
        self.imagesView = imagesView
        super.init(nibName: nil, bundle: nil)
    }
    
    func setPresenter(_ presenter: ImagesPresenterProtocol) {
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        super.loadView()
        
        self.presenter?.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad()
    }
}

extension ImagesUI: ImagesUIProtocol {
    var viewController: UIViewController {
        return self
    }
    
    var heightForRowHandler: ((IndexPath) -> CGFloat)? {
        get {
            return self.imagesView.heightForRowHandler
        }
        set {
            self.imagesView.heightForRowHandler = newValue
        }
    }
    
    var numberOfRowsHandler: (() -> Int)? {
        get {
            return self.imagesView.numberOfRowsHandler
        }
        set {
            self.imagesView.numberOfRowsHandler = newValue
        }
    }
    
    var cellWillAppearHandler: ((ImageTableCellProtocol, IndexPath) -> Void)? {
        get {
            return self.imagesView.cellWillAppearHandler
        }
        set {
            self.imagesView.cellWillAppearHandler = newValue
        }
    }
    
    var searchButtonTapHanlder: ((String?) -> Void)? {
        get {
            return self.imagesView.searchButtonTapHanlder
        }
        set {
            self.imagesView.searchButtonTapHanlder = newValue
        }
    }
    
    func replaceScreenView() {
        self.view = imagesView.view
    }
    
    func reloadImages() {
        self.imagesView.reloadImages()
    }
    
    func configureUI() {
        self.imagesView.configureView()
    }
}

