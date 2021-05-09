//
//  TeamTableViewCell.swift
//  Autobiography
//
//  Created by Никита Гусев on 09.05.2021.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    static let identifier = "TeamTableViewCell"

    let teamImageView = UIImageView()
    let teamNameLabel = UILabel()
    let teamRosterLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TeamTableViewCell {
    func setupView() {
        self.setupImageView()
        self.setupTeamNameLabel()
        self.setupTeamRosterLabel()
    }

    func setupImageView() {
        self.contentView.addSubview(self.teamImageView)
        self.teamImageView.translatesAutoresizingMaskIntoConstraints = false
        self.teamImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
    }

    func setupTeamNameLabel() {
        self.contentView.addSubview(self.teamNameLabel)
        self.teamNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.teamNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(self.teamImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        self.teamNameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.teamNameLabel.textColor = .orange
    }

    func setupTeamRosterLabel() {
        self.contentView.addSubview(self.teamRosterLabel)
        self.teamRosterLabel.translatesAutoresizingMaskIntoConstraints = false
        self.teamRosterLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.teamNameLabel.snp.bottom).offset(5)
            make.left.equalTo(self.teamImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        self.teamRosterLabel.font = .systemFont(ofSize: 13, weight: .light)
        self.teamRosterLabel.textColor = .gray
    }
}
