//
//  MotivatorCollectionViewCell.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

protocol MotivatorsCellProtocol {
    func setNameLabelText(_ text: String)
    func setMotivatorImage(_ image: UIImage)
}

class MotivatorCollectionViewCell: UICollectionViewCell {
    static let identifier = MotivatorsConstants.cellIdentifier
    
    private let nameLabel = UILabel()
    private let motivatorImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(MotivatorsConstants.initError)
    }
}

extension MotivatorCollectionViewCell: MotivatorsCellProtocol {
    func setNameLabelText(_ text: String) {
        self.nameLabel.text = text
    }
    
    func setMotivatorImage(_ image: UIImage) {
        self.motivatorImageView.image = image
    }
}

private extension MotivatorCollectionViewCell {
    func setupView() {
        self.contentView.backgroundColor = MotivatorsConstants.contentViewBackgroundColor
        self.contentView.layer.cornerRadius = MotivatorsConstants.contentViewCornerRadius
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
        self.nameLabel.font = MotivatorsConstants.nameLabelFont
        self.nameLabel.textColor = MotivatorsConstants.nameLabelTextColor
        self.nameLabel.textAlignment = .center
        self.nameLabel.adjustsFontSizeToFitWidth = true
        self.nameLabel.minimumScaleFactor = MotivatorsConstants.nameLabelMinimulScaleFactor
    }
}
