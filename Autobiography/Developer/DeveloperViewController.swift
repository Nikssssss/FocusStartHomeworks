//
//  ViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 01.05.2021.
//

import UIKit

class DeveloperViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
}

private extension DeveloperViewController {
    func setupView() {
        self.view.backgroundColor = DeveloperConstants.viewBackgroundColor
        self.setupNavigationItem()
        self.setupTabBarItem()
        var lastLabel = self.setupInformationBlock(title: DeveloperInfo.startProgramminTitle,
                                   text: DeveloperInfo.startProgrammingText,
                                   topAnchor: self.view.topAnchor)
        lastLabel = self.setupInformationBlock(title: DeveloperInfo.programminLanguagesTitle,
                                   text: DeveloperInfo.programmingLanguages,
                                   topAnchor: lastLabel.bottomAnchor)
        self.setupInformationBlock(title: DeveloperInfo.focusStartExpectationsTitle,
                                   text: DeveloperInfo.focusStartExpectations,
                                   topAnchor: lastLabel.bottomAnchor)
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = DeveloperConstants.navigationItemTitle
    }
    
    func setupTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = DeveloperConstants.tabBarItemTitle
        tabBarItem.image = DeveloperConstants.tabBarItemImage
        self.tabBarItem = tabBarItem
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
}

