//
//  CarTableViewCell.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import UIKit
import SnapKit

class CarTableViewCell: UITableViewCell {
    static let identifier = "CarTableViewCell"
    
    private let manufactureLabel = UILabel()
    private let modelLabel = UILabel()
    private let bodyLabel = UILabel()
    private let yearOfIssueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 5,
                                                                               left: 10,
                                                                               bottom: 5,
                                                                               right: 10))
        self.contentView.layer.borderWidth = 0.4
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.cornerRadius = 10
    }
    
    func setManufacture(to manufacture: String) {
        self.manufactureLabel.text = "Производитель: \(manufacture)"
    }
    
    func setModel(to model: String) {
        self.modelLabel.text = "Модель: \(model)"
    }
    
    func setBody(to body: Body) {
        self.bodyLabel.text = "Тип кузова: \(body.rawValue)"
    }
    
    func setYearOfIssue(to yearOfIssue: String) {
        self.yearOfIssueLabel.text = "Год выпуска: \(yearOfIssue)"
    }
}

private extension CarTableViewCell {
    func setupView() {
        self.contentView.backgroundColor = .white
        self.selectionStyle = .none
        self.setupMainLabel(self.manufactureLabel, topAnchor: self.contentView)
        self.setupMainLabel(self.modelLabel, topAnchor: self.manufactureLabel.snp.bottom)
        self.setupAdditionalLabel(self.bodyLabel, topAnchor: self.modelLabel.snp.bottom)
        self.setupAdditionalLabel(self.yearOfIssueLabel, topAnchor: self.bodyLabel.snp.bottom)
    }
    
    func setupMainLabel(_ label: UILabel, topAnchor: ConstraintRelatableTarget) {
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .orange
        self.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { (make) in
            make.top.equalTo(topAnchor).offset(10)
            make.right.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(20)
        }
    }
    
    func setupAdditionalLabel(_ label: UILabel, topAnchor: ConstraintRelatableTarget) {
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        self.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { (make) in
            make.top.equalTo(topAnchor).offset(10)
            make.right.equalToSuperview().offset(-15)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(16)
        }
    }
}
