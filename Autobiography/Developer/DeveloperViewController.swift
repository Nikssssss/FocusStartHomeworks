//
//  ViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 01.05.2021.
//

import UIKit

class DeveloperViewController: UIViewController {
    private let router = Router()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        Logger.logCallingMethod(of: DeveloperViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: DeveloperViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: DeveloperViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: DeveloperViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: DeveloperViewController.self)
    }
}

private extension DeveloperViewController {
    func setupView() {
        self.view.backgroundColor = DeveloperConstants.viewBackgroundColor
        self.setupNavigationItem()
        var lastLabel = self.setupInformationBlock(title: DeveloperInfo.startProgramminTitle,
                                   text: DeveloperInfo.startProgrammingText,
                                   topAnchor: self.view.topAnchor)
        lastLabel = self.setupInformationBlock(title: DeveloperInfo.programminLanguagesTitle,
                                   text: DeveloperInfo.programmingLanguages,
                                   topAnchor: lastLabel.bottomAnchor)
        self.setupInformationBlock(title: DeveloperInfo.focusStartExpectationsTitle,
                                   text: DeveloperInfo.focusStartExpectations,
                                   topAnchor: lastLabel.bottomAnchor)
        self.setupMotivatorsButton()
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = DeveloperConstants.navigationItemTitle
    }
    
    func setupInformationBlock(title: String,
                               text: String,
                               topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> UILabel {
        let titleLabel = self.setupLabel(labelText: title, topAnchor: topAnchor, topConstant: 35)
        let textLabel = self.setupLabel(labelText: text, topAnchor: titleLabel.bottomAnchor, topConstant: 10)
        return textLabel
    }
    
    func setupLabel(labelText: String, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, topConstant: CGFloat) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = labelText
        self.view.addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        label.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        label.numberOfLines = 0
        return label
    }
    
    func setupMotivatorsButton() {
        let motivatorsButton = UIButton()
        self.view.addSubview(motivatorsButton)
        motivatorsButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.height.equalTo(50)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        motivatorsButton.setTitle(DeveloperConstants.motivatorsButtonTitle, for: .normal)
        motivatorsButton.backgroundColor = DeveloperConstants.motivatorsButtonBackgroundColor
        motivatorsButton.layer.cornerRadius = DeveloperConstants.motivatorsButtonCornerRadius
        motivatorsButton.setTitleColor(DeveloperConstants.motivatorsButtonTitleColor, for: .normal)
        motivatorsButton.addTarget(self,
                                   action: #selector(self.motivatorsButtonPressed),
                                   for: .touchUpInside)
        motivatorsButton.layer.shadowOffset = HobbyConstants.nextHobbyButtonShadowOffset
        motivatorsButton.layer.shadowColor = DeveloperConstants.motivatorsButtonShadowColor
        motivatorsButton.layer.shadowRadius = HobbyConstants.nextHobbyButtonShadowRadius
        motivatorsButton.layer.shadowOpacity = HobbyConstants.nextHobbyButtonShadowOpacity
    }
    
    @objc func motivatorsButtonPressed() {
        self.router.showMotivatorsScene(from: self)
    }
}

