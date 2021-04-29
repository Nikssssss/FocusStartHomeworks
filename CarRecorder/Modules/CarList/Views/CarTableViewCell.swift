//
//  CarTableViewCell.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import UIKit
import SnapKit

class CarTableViewCell: UITableViewCell {
    static let identifier = CarListConstants.carTableCellIdentifier
    
    private let manufactureLabel = UILabel()
    private let modelLabel = UILabel()
    private let bodyLabel = UILabel()
    private let yearOfIssueLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(CarListConstants.initError)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: CarListConstants.cellInsets)
        self.contentView.layer.borderWidth = CarListConstants.cellBorderWidth
        self.contentView.layer.borderColor = CarListConstants.cellBorderColor
        self.contentView.layer.cornerRadius = CarListConstants.cellBorderCornerRadius
    }
    
    func setManufacture(to manufacture: String) {
        let manufactureText = CarListConstants.manufactureTemplateText + manufacture
        self.manufactureLabel.text = manufactureText
    }
    
    func setModel(to model: String) {
        let modelText = CarListConstants.modelTemplateText + model
        self.modelLabel.text = modelText
    }
    
    func setBody(to body: Body) {
        let bodyText = CarListConstants.bodyTemplateText + body.rawValue
        self.bodyLabel.text = bodyText
    }
    
    func setYearOfIssue(to yearOfIssue: String) {
        let yearOfIssueText = CarListConstants.yearOfIssueTemplateText + yearOfIssue
        self.yearOfIssueLabel.text = yearOfIssueText
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
        label.font = CarListConstants.mainLabelFont
        label.textColor = CarListConstants.mainLabelTextColor
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
        label.font = CarListConstants.additionalLabelFont
        label.textColor = CarListConstants.additionalLabelTextColor
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
