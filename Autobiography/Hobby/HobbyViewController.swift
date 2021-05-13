//
//  HobbyViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 03.05.2021.
//

import UIKit

class HobbyViewController: UIViewController {
    private var hobbiesContentView = UIView()
    private let favouriteTeamsButton = UIButton()
    private let showNextHobbyButton = UIButton()
    private var hobbyViews = [HobbyCardView]()
    private var hobbies = [Hobby]()
    
    private let router = Router()
    
    private var currentShowingHobbyView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeHobbies()
        self.setupView()
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        Logger.logCallingMethod(of: HobbyViewController.self)
    }
}

private extension HobbyViewController {
    func initializeHobbies() {
        self.hobbies.append(Hobby(hobbyTitle: "Киберспорт",
                                  hobbyDescription: "Чаще всего в свободное от учёбы время я смотрю турниры по CS:GO, болею за команду NaVi. NaVi дави!!!"))
        self.hobbies.append(Hobby(hobbyTitle: "Хоккей", hobbyDescription: "Помимо киберспорта я иногда могу посмотреть матчи по хоккею. По моему мнению, это самый интересный для просмотра вид спорта благодаря его динамичности"))
        self.hobbies.append(Hobby(hobbyTitle: "Путешествия", hobbyDescription: "Интересно, кто не любит путешествовать? Вот я не из таких. Если бы позволяли финансы, я бы путешествовал каждые полгода"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
    }
    
    func setupView() {
        self.view.backgroundColor = HobbyConstants.viewBackgroundColor
        self.setupNavigationItem()
        self.setupHobbiesContentView()
        self.setupFavouriteTeamsButton()
        self.setupShowNextHobbyButton()
        self.setupHobbyViews()
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = HobbyConstants.navigationItemTitle
    }
    
    func setupHobbiesContentView() {
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(self.hobbiesContentView)
        self.hobbiesContentView.translatesAutoresizingMaskIntoConstraints = false
        self.hobbiesContentView.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(self.view.safeAreaLayoutGuide)
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
        var lastView: UIView = self.showNextHobbyButton
        for hobby in self.hobbies.reversed() {
            let hobbyView = HobbyCardView()
            hobbyView.setHobbyTitle(to: hobby.hobbyTitle)
            hobbyView.setHobbyDescription(to: hobby.hobbyDescription)
            hobbyView.backgroundColor = HobbyConstants.hobbyViewBackgroundColor
            hobbyView.delegate = self
            self.hobbyViews.append(hobbyView)
            
            self.hobbiesContentView.addSubview(hobbyView)
            hobbyView.snp.makeConstraints { (make) in
                make.top.equalTo(lastView.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.height.equalTo(120)
            }
            lastView = hobbyView
        }
        self.currentShowingHobbyView = self.hobbies.count - 1
    }
    
    @objc func showNextHobbyButtonPressed() {
        guard self.currentShowingHobbyView > 0 else {
            return
        }
        UIView.animate(withDuration: 1) {
            let betweenViewOffset: CGFloat = HobbyConstants.betweenViewOffset
            let nextHobbyView = self.hobbyViews[self.currentShowingHobbyView - 1]
            let numberOfShowingHobbyViews = self.hobbyViews.count - self.currentShowingHobbyView
            nextHobbyView.frame.origin.y += CGFloat(numberOfShowingHobbyViews) *
                (nextHobbyView.frame.height + betweenViewOffset)
        }
        self.currentShowingHobbyView -= 1
    }
    
    @objc func favouriteTeamsButtonPressed() {
        router.showTeamsScene(from: self)
    }
}
