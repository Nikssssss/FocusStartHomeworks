//
//  MotivatorsView.swift
//  Autobiography
//
//  Created by Никита Гусев on 17.05.2021.
//

import UIKit

class MotivatorsView: UIView {
    private var motivatorsCollectionView: UICollectionView!
    
    weak var delegate: UICollectionViewDelegate?
    weak var dataSource: UICollectionViewDataSource?
    
    func configureView() {
        self.setupView()
    }
}

private extension MotivatorsView {
    func setupView() {
        self.backgroundColor = .white
        self.setupMotivatorsCollectionView()
    }
    
    func setupMotivatorsCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.motivatorsCollectionView = UICollectionView(frame: .zero,
                                                         collectionViewLayout: layout)
        self.addSubview(self.motivatorsCollectionView)
        self.motivatorsCollectionView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        self.motivatorsCollectionView.delegate = self.delegate
        self.motivatorsCollectionView.dataSource = self.dataSource
        self.motivatorsCollectionView.register(MotivatorCollectionViewCell.self,
                                               forCellWithReuseIdentifier: MotivatorCollectionViewCell.identifier)
        self.motivatorsCollectionView.backgroundColor = MotivatorsConstants.collectionViewBackgroundColor
    }
}
