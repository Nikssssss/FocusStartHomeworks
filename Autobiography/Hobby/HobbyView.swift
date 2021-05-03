//
//  HobbyView.swift
//  Autobiography
//
//  Created by Никита Гусев on 03.05.2021.
//

import UIKit
import SnapKit

class HobbyView: UIView {
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
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHobbyTitle(to title: String) {
        self.hobbyTitleLabel.text = title
    }
    
    func setHobbyDescription(to description: String) {
        self.hobbyDescriptionLabel.text = description
    }
}

private extension HobbyView {
    func setupView() {
        self.layer.cornerRadius = 15
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
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
        self.hobbyTitleLabel.textColor = .white
        self.hobbyTitleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    func setupShowDescriptionButton() {
        self.addSubview(self.showDescriptionButton)
        self.showDescriptionButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(self.hobbyTitleLabel.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(25)
        }
        self.showDescriptionButton.setTitle("Подробнее", for: .normal)
        self.showDescriptionButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        self.showDescriptionButton.backgroundColor = .purple
        self.showDescriptionButton.layer.cornerRadius = 7
        self.showDescriptionButton.setTitleColor(.white, for: .normal)
        self.showDescriptionButton.addTarget(self,
                                             action: #selector(self.showDescriptionButtonPressed),
                                             for: .touchUpInside)
    }
    
    func setupDescriptionSwitch() {
        let switchLabel = UILabel()
        switchLabel.text = "Всплывающее окно"
        switchLabel.font = .systemFont(ofSize: 10, weight: .medium)
        switchLabel.textColor = .white
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
        self.descriptionSwitch.backgroundColor = .lightGray
        self.descriptionSwitch.layer.cornerRadius = 16
        self.descriptionSwitch.setOn(false, animated: true)
    }
    
    func setupDescriptionLabel() {
        self.addSubview(self.hobbyDescriptionLabel)
        self.hobbyDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.hobbyTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(15)
            make.right.equalTo(self.descriptionSwitch.snp.left).offset(-10)
        }
        self.hobbyDescriptionLabel.textColor = .white
        self.hobbyDescriptionLabel.font = .systemFont(ofSize: 11, weight: .medium)
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
        let alert = UIAlertController(title: "Подробнее", message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default))
        self.delegate.present(alert, animated: true, completion: nil)
    }
}
