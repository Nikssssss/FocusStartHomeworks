//
//  MotivatorsView.swift
//  Autobiography
//
//  Created by Никита Гусев on 17.05.2021.
//

import UIKit

protocol MotivatorsViewProtocol: class {
    var view: UIView { get }
    var sizeForItemAt: ((_ indexPath: IndexPath) -> CGSize)? { get set }
    var numberOfMotivators: (() -> Int)? { get set }
    var cellWillAppear: ((MotivatorsCellProtocol, IndexPath) -> Void)? { get set }
    var minimumInteritemSpacing: (() -> CGFloat)? { get set }
    func configureView()
}

class MotivatorsView: UIView {
    var sizeForItemAt: ((_ indexPath: IndexPath) -> CGSize)?
    var numberOfMotivators: (() -> Int)?
    var cellWillAppear: ((MotivatorsCellProtocol, IndexPath) -> Void)?
    var minimumInteritemSpacing: (() -> CGFloat)?
    
    private var motivatorsCollectionView: UICollectionView?
}

extension MotivatorsView: MotivatorsViewProtocol {
    var view: UIView {
        return self
    }
    
    func configureView() {
        self.setupView()
    }
}

extension MotivatorsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeForItemAt?(indexPath) ?? .zero
    }
}

extension MotivatorsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.numberOfMotivators?() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MotivatorCollectionViewCell.identifier,
                                                      for: indexPath) as! MotivatorCollectionViewCell
        self.cellWillAppear?(cell, indexPath)
        return cell
    }
}

extension MotivatorsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.minimumInteritemSpacing?() ?? 0
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
        
        guard let motivatorsCollectionView = self.motivatorsCollectionView else { return }
        
        self.addSubview(motivatorsCollectionView)
        motivatorsCollectionView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        motivatorsCollectionView.delegate = self
        motivatorsCollectionView.dataSource = self
        motivatorsCollectionView.register(MotivatorCollectionViewCell.self,
                                               forCellWithReuseIdentifier: MotivatorCollectionViewCell.identifier)
        motivatorsCollectionView.backgroundColor = MotivatorsConstants.collectionViewBackgroundColor
    }
}
