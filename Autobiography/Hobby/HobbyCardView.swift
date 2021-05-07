//
//  HobbyView.swift
//  Autobiography
//
//  Created by Никита Гусев on 03.05.2021.
//

import UIKit
import SnapKit

class HobbyCardView: UIView {
    private let hobbyTitleLabel = UILabel()
    private let hobbyDescriptionLabel = UILabel()
    private let showDescriptionButton = UIButton()
    private let descriptionSwitch = UISwitch()
    
    weak var delegate: HobbyViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(HobbyConstants.initError)
    }
    
    func setHobbyTitle(to title: String) {
        self.hobbyTitleLabel.text = title
    }
    
    func setHobbyDescription(to description: String) {
        self.hobbyDescriptionLabel.text = description
    }
}

private extension HobbyCardView {
    func setupView() {
        self.layer.cornerRadius = HobbyConstants.hobbyCardViewCornerRadius
        self.layer.shadowOffset = HobbyConstants.hobbyCardViewShadowOffset
        self.layer.shadowColor = HobbyConstants.hobbyCardViewShadowColor
        self.layer.shadowRadius = HobbyConstants.hobbyCardViewShadowRadius
        self.layer.shadowOpacity = HobbyConstants.hobbyCardViewShadowOpacity
        self.setupHobbyTitleLabel()
        self.setupShowDescriptionButton()
        self.setupDescriptionSwitch()
        self.setupDescriptionLabel()
    }
    
    func setupHobbyTitleLabel() {
        self.addSubview(self.hobbyTitleLabel)
        self.hobbyTitleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        self.hobbyTitleLabel.textColor = HobbyConstants.hobbyTitleLabelTextColor
        self.hobbyTitleLabel.font = HobbyConstants.hobbyTitleLabelFont
    }
    
    func setupShowDescriptionButton() {
        self.addSubview(self.showDescriptionButton)
        self.showDescriptionButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(self.hobbyTitleLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(25)
        }
        self.showDescriptionButton.setTitle(HobbyConstants.showDescriptionButtonTitle, for: .normal)
        self.showDescriptionButton.titleLabel?.font = HobbyConstants.showDescriptionButtonTitleFont
        self.showDescriptionButton.backgroundColor = HobbyConstants.showDescriptionButtonBackgroundColor
        self.showDescriptionButton.layer.cornerRadius = HobbyConstants.showDescriptionButtonCornerRadius
        self.showDescriptionButton.setTitleColor(HobbyConstants.showDescriptionButtonTitleColor, for: .normal)
        self.showDescriptionButton.addTarget(self,
                                             action: #selector(self.showDescriptionButtonPressed),
                                             for: .touchUpInside)
    }
    
    func setupDescriptionSwitch() {
        let switchLabel = UILabel()
        switchLabel.text = HobbyConstants.switchLabelText
        switchLabel.font = HobbyConstants.switchLabelFont
        switchLabel.textColor = HobbyConstants.switchLabelTextColor
        self.addSubview(switchLabel)
        switchLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.showDescriptionButton.snp.bottom).offset(7)
            make.left.equalTo(self.showDescriptionButton.snp.left)
        }
        
        self.addSubview(self.descriptionSwitch)
        self.descriptionSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(switchLabel.snp.bottom).offset(2)
            make.left.equalTo(switchLabel.snp.left)
        }
        self.descriptionSwitch.backgroundColor = HobbyConstants.descriptionSwitchBackgroundColor
        self.descriptionSwitch.layer.cornerRadius = HobbyConstants.descriptionSwitchCornerRadius
        self.descriptionSwitch.setOn(false, animated: true)
    }
    
    func setupDescriptionLabel() {
        self.addSubview(self.hobbyDescriptionLabel)
        self.hobbyDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.hobbyTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(15)
            make.right.equalTo(self.descriptionSwitch.snp.left).offset(-10)
        }
        self.hobbyDescriptionLabel.textColor = HobbyConstants.hobbyDescriptionLabelTextColor
        self.hobbyDescriptionLabel.font = HobbyConstants.hobbyDescriptionLabelFont
        self.hobbyDescriptionLabel.numberOfLines = 0
        self.hobbyDescriptionLabel.alpha = 0
    }
    
    @objc func showDescriptionButtonPressed() {
        if self.descriptionSwitch.isOn {
            guard let description = self.hobbyDescriptionLabel.text else {
                return
            }
            self.showDescriptionLikeAnAlert(description: description)
        } else {
            UIView.animate(withDuration: 0.5) {
                if self.hobbyDescriptionLabel.alpha == 0 {
                    self.hobbyDescriptionLabel.alpha = 1
                } else {
                    self.hobbyDescriptionLabel.alpha = 0
                }
            }
        }
    }
    
    func showDescriptionLikeAnAlert(description: String) {
        let alert = UIAlertController(title: HobbyConstants.descriptionAlertControllerTitle,
                                      message: description,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: HobbyConstants.descriptionAlertControllerActionTitle, style: .default))
        self.delegate.present(alert, animated: true, completion: nil)
    }
}
