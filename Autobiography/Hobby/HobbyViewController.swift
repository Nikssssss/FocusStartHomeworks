//
//  HobbyViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 03.05.2021.
//

import UIKit

class HobbyViewController: UIViewController {
    private let showNextHobbyButton = UIButton()
    private var hobbyViews = [HobbyView]()
    private var hobbies = [Hobby]()
    
    private var currentShowingHobbyView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeHobbies()
        self.setupView()
    }
}

private extension HobbyViewController {
    func initializeHobbies() {
        self.hobbies.append(Hobby(hobbyTitle: "Киберспорт",
                                  hobbyDescription: "Чаще всего в свободное от учёбы время я смотрю турниры по CS:GO, болею за команду NaVi. NaVi дави!!!"))
        self.hobbies.append(Hobby(hobbyTitle: "Хоккей", hobbyDescription: "Помимо киберспорта я иногда могу посмотреть матчи по хоккею. По моему мнению, это самый интересный для просмотра вид спорта благодаря его динамичности"))
        self.hobbies.append(Hobby(hobbyTitle: "Путешествия", hobbyDescription: "Интересно, кто не любит путешествовать? Вот я не из таких. Если бы позволяли финансы, я бы путешествовал каждые полгода"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
    }
    
    func setupView() {
        self.setupNavigationItem()
        self.setupTabBarItem()
        self.setupShowNextHobbyButton()
        self.setupHobbyViews()
    }
    
    func setupNavigationItem() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "Мои хобби"
    }
    
    func setupTabBarItem() {
        let tabBarItem = UITabBarItem()
        tabBarItem.title = "Хобби"
        tabBarItem.image = UIImage(systemName: "wand.and.stars")
        self.tabBarItem = tabBarItem
    }
    
    func setupShowNextHobbyButton() {
        self.view.addSubview(self.showNextHobbyButton)
        self.showNextHobbyButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        self.showNextHobbyButton.setTitle("Cледующее хобби", for: .normal)
        self.showNextHobbyButton.backgroundColor = .blue
        self.showNextHobbyButton.layer.cornerRadius = 12
        self.showNextHobbyButton.setTitleColor(.white, for: .normal)
        self.showNextHobbyButton.addTarget(self,
                                           action: #selector(self.showNextHobbyButtonPressed),
                                           for: .touchUpInside)
        self.showNextHobbyButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.showNextHobbyButton.layer.shadowColor = UIColor.blue.cgColor
        self.showNextHobbyButton.layer.shadowRadius = 3
        self.showNextHobbyButton.layer.shadowOpacity = 0.4
    }
    
    func setupHobbyViews() {
        for hobby in self.hobbies.reversed() {
            let hobbyView = HobbyView()
            hobbyView.setHobbyTitle(to: hobby.hobbyTitle)
            hobbyView.setHobbyDescription(to: hobby.hobbyDescription)
            hobbyView.backgroundColor = .orange
            hobbyView.delegate = self
            self.hobbyViews.append(hobbyView)
            
            self.view.addSubview(hobbyView)
            hobbyView.snp.makeConstraints { (make) in
                make.top.equalTo(self.showNextHobbyButton.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.height.equalTo(120)
            }
        }
        self.currentShowingHobbyView = 3
    }
    
    @objc func showNextHobbyButtonPressed() {
        guard self.currentShowingHobbyView > 0 else {
            return
        }
        UIView.animate(withDuration: 1) {
            let betweenViewOffset: CGFloat = 10
            let nextHobbyView = self.hobbyViews[self.currentShowingHobbyView - 1]
            let numberOfShowingHobbyViews = self.hobbyViews.count - self.currentShowingHobbyView
            nextHobbyView.frame.origin.y += CGFloat(numberOfShowingHobbyViews) *
                (nextHobbyView.frame.height + betweenViewOffset)
        }
        self.currentShowingHobbyView -= 1
    }
}
