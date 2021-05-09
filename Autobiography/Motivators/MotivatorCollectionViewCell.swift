//
//  MotivatorCollectionViewCell.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

class MotivatorCollectionViewCell: UICollectionViewCell {
    static let identifier = "MotivatorCollectionViewCell"
    
    let nameLabel = UILabel()
    let motivatorImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MotivatorCollectionViewCell {
    func setupView() {
        self.contentView.backgroundColor = .black
        self.contentView.layer.cornerRadius = 15
        self.contentView.clipsToBounds = true
        self.setupMotivatorImageView()
        self.setupNameLabel()
    }
    
    func setupMotivatorImageView() {
        self.contentView.addSubview(self.motivatorImageView)
        self.motivatorImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
        self.motivatorImageView.clipsToBounds = true
        self.motivatorImageView.contentMode = .scaleAspectFill
    }
    
    func setupNameLabel() {
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.motivatorImageView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
        self.nameLabel.font = .systemFont(ofSize: 15, weight: .medium)
        self.nameLabel.textColor = .white
        self.nameLabel.textAlignment = .center
        self.nameLabel.adjustsFontSizeToFitWidth = true
        self.nameLabel.minimumScaleFactor = 0.6
    }
}
