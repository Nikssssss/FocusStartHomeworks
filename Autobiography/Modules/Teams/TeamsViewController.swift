//
//  TeamsViewController.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

class TeamsViewController: UIViewController {
    private let teamsTableView = UITableView()
    
    private var teams = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeTeams()
        self.setupView()
        Logger.logCallingMethod(of: TeamsViewController.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        Logger.logCallingMethod(of: TeamsViewController.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        Logger.logCallingMethod(of: TeamsViewController.self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        Logger.logCallingMethod(of: TeamsViewController.self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        Logger.logCallingMethod(of: TeamsViewController.self)
    }
    
    func initializeTeams() {
        self.teams.append(Team(name: "NaVi",
                               imageUrl: "https://upload.wikimedia.org/wikipedia/ru/thumb/2/2c/NAVI_logo.png/1200px-NAVI_logo.png",
                               roster: ["s1mple", "electronic", "Boombl4", "Perfecto", "b1t"]))
        self.teams.append(Team(name: "Gambit",
                               imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Gambit_Esports_2020_logo.svg/1920px-Gambit_Esports_2020_logo.svg.png",
                               roster: ["nafany", "HObbit", "interz", "Ax1le", "sh1ro"]))
        self.teams.append(Team(name: "Virtus Pro",
                               imageUrl: "https://upload.wikimedia.org/wikipedia/ru/4/4f/Virtus.proLogo.png",
                               roster: ["Jame", "YEKINDAR", "Qikert", "SANJI", "buster"]))
        self.teams.append(Team(name: "Team Spirit",
                               imageUrl: "https://liquipedia.net/commons/images/thumb/f/f2/Team_Spirit_2021.png/1038px-Team_Spirit_2021.png",
                               roster: ["magixx", "mir", "chopper", "degster", "sdy"]))
        self.teams.append(Team(name: "Astralis",
                               imageUrl: "https://upload.wikimedia.org/wikipedia/ru/thumb/9/91/Astralis_logo.png/480px-Astralis_logo.png",
                               roster: ["gla1ve", "dupreeh", "Xyp9x", "Magisk", "Bubzkji"]))
    }
}

extension TeamsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TeamsConstants.teamsCellHeight
    }
}

extension TeamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.identifier,
                                                 for: indexPath) as! TeamTableViewCell
        let currentTeam = teams[indexPath.row]
        cell.teamNameLabel.text = currentTeam.name
        cell.teamRosterLabel.text = String()
        for player in currentTeam.roster {
            cell.teamRosterLabel.text?.append(player + TeamsConstants.interPlayersSpace)
        }
        DispatchQueue.global(qos: .utility).async {
            guard let imageUrl = URL(string: currentTeam.imageUrl) else {
                return
            }
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    cell.teamImageView.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
}

private extension TeamsViewController {
    func setupView() {
        self.setupNavigationItem()
        self.setupTeamsTableView()
    }
    
    func setupNavigationItem() {
        self.navigationItem.title = TeamsConstants.navigationItemTitle
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    func setupTeamsTableView() {
        self.view.addSubview(self.teamsTableView)
        self.teamsTableView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        self.teamsTableView.register(TeamTableViewCell.self,
                                     forCellReuseIdentifier: TeamTableViewCell.identifier)
        self.teamsTableView.dataSource = self
        self.teamsTableView.delegate = self
        self.teamsTableView.tableFooterView = UIView()
    }
}
