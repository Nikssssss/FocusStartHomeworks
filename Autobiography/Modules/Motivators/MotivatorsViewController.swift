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
        motivatorsView.delegate = self
        motivatorsView.dataSource = self
        motivatorsView.configureView()
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
        return self.motivatorsService.numberOfMotivators
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MotivatorCollectionViewCell.identifier,
                                                      for: indexPath) as! MotivatorCollectionViewCell
        let motivator = self.motivatorsService.getMotivator(at: indexPath.row)
        guard let currentMotivator = motivator else { return cell }
        
        cell.nameLabel.text = currentMotivator.name
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: currentMotivator.imageUrl) else { return }
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
        self.router.dismissViewController(self)
    }
}
