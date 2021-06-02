//
//  MotivatorsViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

class MotivatorsViewController: UIViewController {
    private var navigator: Navigator?
    private var motivatorsService: MotivatorsServiceProtocol?
    
    func setMotivatorsService(_ motivatorsService: MotivatorsServiceProtocol) {
        self.motivatorsService = motivatorsService
    }
    
    func setNavigator(navigator: Navigator) {
        self.navigator = navigator
    }
    
    override func loadView() {
        super.loadView()
        
        let motivatorsView = MotivatorsView()
        motivatorsView.delegate = self
        motivatorsView.dataSource = self
        motivatorsView.configureView()
        self.view = motivatorsView
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.motivatorsService?.initializeMotivators()
        self.setupView()
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        Logger.logCallingMethod(of: MotivatorsViewController.self)
    }
}

extension MotivatorsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewWidth = self.view.frame.width
        let interItemOffset = MotivatorsConstants.collectionViewInterItemOffset
        let collectionViewOffset = MotivatorsConstants.collectionViewLeftOffset + MotivatorsConstants.collectionViewRightOffset
        let cellWidth = (Double(viewWidth) - interItemOffset - collectionViewOffset) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

extension MotivatorsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.motivatorsService?.numberOfMotivators ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MotivatorCollectionViewCell.identifier,
                                                      for: indexPath) as! MotivatorCollectionViewCell
        guard let motivator = self.motivatorsService?.getMotivator(at: indexPath.row) else {
            return UICollectionViewCell()
        }
        let motivatorViewInfo = MotivatorsMapper.mapToViewInfo(motivator)
        cell.nameLabel.text = motivatorViewInfo.name
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: motivatorViewInfo.imageUrl) else { return }
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    cell.motivatorImageView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
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
        let navigationItem = ModuleNavigationItem(viewController: self, moduleTag: .developer)
        self.navigator?.hideScene(navigationItem)
    }
}
