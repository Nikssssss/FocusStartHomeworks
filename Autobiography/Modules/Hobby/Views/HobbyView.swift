//
//  HobbyView.swift
//  Autobiography
//
//  Created by Никита Гусев on 17.05.2021.
//

import UIKit

protocol HobbyViewProtocol: class {
    var view: UIView { get }
    var getAllHobbies: (() -> [Hobby]?)? { get set }
    var nextHobbyButtonTapHandler: (() -> Void)? { get set }
    var favouriteTeamsButtonHandler: (() -> Void)? { get set }
    var showAlertHandler: ((String, String) -> Void)? { get set }
    var descriptionButtonTapHandler: ((HobbyCardViewProtocol) -> Void)? { get set }
    
    func configureView()
    func showNextHobby()
}

class HobbyView: UIView {
    private let hobbiesContentView = UIView()
    private let favouriteTeamsButton = UIButton()
    private let showNextHobbyButton = UIButton()
    private var hobbyViews = [HobbyCardViewProtocol]()
    private var currentShowingHobbyView = 0
    
    var getAllHobbies: (() -> [Hobby]?)?
    var nextHobbyButtonTapHandler: (() -> Void)?
    var favouriteTeamsButtonHandler: (() -> Void)?
    var showAlertHandler: ((String, String) -> Void)?
    var descriptionButtonTapHandler: ((HobbyCardViewProtocol) -> Void)?
}

extension HobbyView: HobbyViewProtocol {
    var view: UIView {
        return self
    }
    
    func configureView() {
        self.setupView()
    }
    
    func showNextHobby() {
        guard self.currentShowingHobbyView > 0 else {
            return
        }
        UIView.animate(withDuration: 1) {
            let betweenViewOffset: CGFloat = HobbyConstants.betweenViewOffset
            let nextHobbyView = self.hobbyViews[self.currentShowingHobbyView - 1].view
            let numberOfShowingHobbyViews = self.hobbyViews.count - self.currentShowingHobbyView
            nextHobbyView.frame.origin.y += CGFloat(numberOfShowingHobbyViews) *
                (nextHobbyView.frame.height + betweenViewOffset)
        }
        self.currentShowingHobbyView -= 1
    }
}

private extension HobbyView {
    func setupView() {
        self.backgroundColor = HobbyConstants.viewBackgroundColor
        self.setupHobbiesContentView()
        self.setupFavouriteTeamsButton()
        self.setupShowNextHobbyButton()
        self.setupHobbyViews()
    }
    
    func setupHobbiesContentView() {
        let scrollView = UIScrollView()
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(self.hobbiesContentView)
        self.hobbiesContentView.translatesAutoresizingMaskIntoConstraints = false
        self.hobbiesContentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.safeAreaLayoutGuide)
            make.width.equalTo(self.safeAreaLayoutGuide)
        }
        scrollView.isScrollEnabled = true
    }
    
    func setupFavouriteTeamsButton() {
        self.hobbiesContentView.addSubview(self.favouriteTeamsButton)
        self.favouriteTeamsButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(200)
        }
        self.favouriteTeamsButton.setTitle(HobbyConstants.favouriteTeamsButtonTitle, for: .normal)
        self.favouriteTeamsButton.backgroundColor = HobbyConstants.favouriteTeamsButtonBackgroundColor
        self.favouriteTeamsButton.layer.cornerRadius = HobbyConstants.nextHobbyButtonCornerRadius
        self.favouriteTeamsButton.setTitleColor(HobbyConstants.favouriteTeamsButtonTitleColor, for: .normal)
        self.favouriteTeamsButton.addTarget(self,
                                            action: #selector(self.favouriteTeamsButtonPressed),
                                            for: .touchUpInside)
        self.favouriteTeamsButton.layer.shadowOffset = HobbyConstants.nextHobbyButtonShadowOffset
        self.favouriteTeamsButton.layer.shadowColor = HobbyConstants.favouriteTeamsButtonShadowColor
        self.favouriteTeamsButton.layer.shadowRadius = HobbyConstants.nextHobbyButtonShadowRadius
        self.favouriteTeamsButton.layer.shadowOpacity = HobbyConstants.nextHobbyButtonShadowOpacity
    }
    
    func setupShowNextHobbyButton() {
        self.hobbiesContentView.addSubview(self.showNextHobbyButton)
        self.showNextHobbyButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.favouriteTeamsButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        self.showNextHobbyButton.setTitle(HobbyConstants.nextHobbyButtonTitle, for: .normal)
        self.showNextHobbyButton.backgroundColor = HobbyConstants.nextHobbyButtonBackgroundColor
        self.showNextHobbyButton.layer.cornerRadius = HobbyConstants.nextHobbyButtonCornerRadius
        self.showNextHobbyButton.setTitleColor(HobbyConstants.nextHobbyButtonTitleColor, for: .normal)
        self.showNextHobbyButton.addTarget(self,
                                           action: #selector(self.showNextHobbyButtonPressed),
                                           for: .touchUpInside)
        self.showNextHobbyButton.layer.shadowOffset = HobbyConstants.nextHobbyButtonShadowOffset
        self.showNextHobbyButton.layer.shadowColor = HobbyConstants.nextHobbyButtonShadowColor
        self.showNextHobbyButton.layer.shadowRadius = HobbyConstants.nextHobbyButtonShadowRadius
        self.showNextHobbyButton.layer.shadowOpacity = HobbyConstants.nextHobbyButtonShadowOpacity
    }
    
    func setupHobbyViews() {
        guard let hobbies = getAllHobbies?()?.reversed() else { return }
        var lastView: UIView = self.showNextHobbyButton
        for hobby in hobbies {
            let hobbyCardView: HobbyCardViewProtocol = HobbyCardView()
            hobbyCardView.setHobbyTitle(to: hobby.hobbyTitle)
            hobbyCardView.setHobbyDescription(to: hobby.hobbyDescription)
            hobbyCardView.setBackgroundColor(to: HobbyConstants.hobbyViewBackgroundColor)
            hobbyCardView.showAlertHandler = self.showAlertHandler
            hobbyCardView.descriptionButtonTapHandler = self.descriptionButtonTapHandler
            self.hobbyViews.append(hobbyCardView)
            
            let currentHobbyCardView = hobbyCardView.view
            self.hobbiesContentView.addSubview(currentHobbyCardView)
            currentHobbyCardView.snp.makeConstraints { (make) in
                make.top.equalTo(lastView.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.height.equalTo(120)
            }
            lastView = currentHobbyCardView
        }
        self.currentShowingHobbyView = hobbies.count - 1
    }
    
    @objc func showNextHobbyButtonPressed() {
        self.nextHobbyButtonTapHandler?()
    }
    
    @objc func favouriteTeamsButtonPressed() {
        self.favouriteTeamsButtonHandler?()
    }
}
