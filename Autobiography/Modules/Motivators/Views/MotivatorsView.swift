//
//  MotivatorsView.swift
//  Autobiography
//
//  Created by Никита Гусев on 17.05.2021.
//

import UIKit

class MotivatorsView: UIView {
    private var motivatorsCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MotivatorsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //Я не понял как это связывать с презентерами
        let viewWidth = self.frame.width
        let interItemOffset = MotivatorsConstants.collectionViewInterItemOffset
        let collectionViewOffset = MotivatorsConstants.collectionViewLeftOffset + MotivatorsConstants.collectionViewRightOffset
        let cellWidth = (Double(viewWidth) - interItemOffset - collectionViewOffset) / 2
        return CGSize(width: cellWidth, height: cellWidth)
    }
}

extension MotivatorsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return MotivatorsCellPresenter().numberOfItems //Я не понял как это связывать с несколькими презентерами
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MotivatorCollectionViewCell.identifier,
                                                      for: indexPath) as! MotivatorCollectionViewCellProtocol
        let presenterFactory = PresenterFactoryCreator.getPresentersFactory(for: indexPath.row)
        let presenter = presenterFactory.createCellPresenter()
        presenter.cellDidLoad(cell: cell, row: indexPath.row)
        return cell.cell
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
        self.motivatorsCollectionView.delegate = self
        self.motivatorsCollectionView.dataSource = self
        self.motivatorsCollectionView.register(MotivatorCollectionViewCell.self,
                                               forCellWithReuseIdentifier: MotivatorCollectionViewCell.identifier)
        self.motivatorsCollectionView.backgroundColor = MotivatorsConstants.collectionViewBackgroundColor
    }
}
