//
//  ImageTableViewCell.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import UIKit

protocol ImageTableCellProtocol: class {
    var cell: UITableViewCell { get }
    func setImage(_ image: UIImage)
}

class ImageTableViewCell: UITableViewCell {
    static let identifier = ImagesConstants.imageTableCellIdentifier
    
    private let customImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension ImageTableViewCell: ImageTableCellProtocol {
    var cell: UITableViewCell {
        return self
    }
    
    func setImage(_ image: UIImage) {
        self.customImageView.image = image
    }
}

private extension ImageTableViewCell {
    func setupView() {
        self.setupImageView()
    }
    
    func setupImageView() {
        self.addSubview(self.customImageView)
        self.customImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
