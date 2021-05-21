//
//  MotivatorsViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

class MotivatorsViewController: UIViewController {
    private let router = Router()
    private let motivatorsService: MotivatorsServiceProtocol = MotivatorsService()
    
    override func loadView() {
        super.loadView()
        
        let motivatorsView = MotivatorsView()
        self.view = motivatorsView
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.motivatorsService.initializeMotivators()
        self.setupView()
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
}

extension MotivatorsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(MotivatorsConstants.collectionViewInterItemOffset)
    }
}

private extension MotivatorsViewController {
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
        self.router.dismissViewController(self)
    }
}
