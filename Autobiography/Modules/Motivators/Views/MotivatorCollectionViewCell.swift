//
//  MotivatorCollectionViewCell.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

protocol MotivatorCollectionViewCellProtocol {
    var cell: UICollectionViewCell { get }
    func configureUI(using motivator: MotivatorViewModel)
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

extension MotivatorCollectionViewCell: MotivatorCollectionViewCellProtocol {
    var cell: UICollectionViewCell {
        return self
    }
    
    func configureUI(using motivator: MotivatorViewModel) {
        self.nameLabel.text = motivator.name
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: motivator.imageUrl) else { return }
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.motivatorImageView.image = UIImage(data: data)
                }
            }
        }
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
