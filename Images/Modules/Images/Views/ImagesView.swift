//
//  ImagesView.swift
//  Images
//
//  Created by Никита Гусев on 31.05.2021.
//

import UIKit
import SnapKit

protocol ImagesViewProtocol: class {
    var view: UIView { get }
    var heightForRowHandler: ((_ indexPath: IndexPath) -> CGFloat)? { get set }
    var numberOfRowsHandler: (() -> Int)? { get set }
    var cellWillAppearHandler: ((ImageTableCellProtocol, IndexPath) -> Void)? { get set }
    var searchButtonTapHanlder: ((String?) -> Void)? { get set }
    
    func configureView()
    func reloadImages()
}

class ImagesView: UIView {
    var heightForRowHandler: ((_ indexPath: IndexPath) -> CGFloat)?
    var numberOfRowsHandler: (() -> Int)?
    var cellWillAppearHandler: ((ImageTableCellProtocol, IndexPath) -> Void)?
    var searchButtonTapHanlder: ((String?) -> Void)?
    
    private let imageSearchBar = UISearchBar()
    private let imagesTableView = UITableView()
}

extension ImagesView: ImagesViewProtocol {
    var view: UIView {
        return self
    }
    
    func configureView() {
        self.setupView()
    }
    
    func reloadImages() {
        self.imagesTableView.reloadData()
    }
}

extension ImagesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightForRowHandler?(indexPath) ?? 0
    }
}

extension ImagesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfRowsHandler?() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier,
                                                       for: indexPath) as? ImageTableCellProtocol else {
            return UITableViewCell()
        }
        self.cellWillAppearHandler?(cell, indexPath)
        return cell.cell
    }
}

extension ImagesView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchButtonTapHanlder?(searchBar.text)
    }
}

private extension ImagesView {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupImageSearchBar()
        self.setupImagesTableView()
    }
    
    func setupImageSearchBar() {
        self.addSubview(self.imageSearchBar)
        self.imageSearchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        self.imageSearchBar.placeholder = ImagesConstants.imageSearchBarPlaceholder
        self.imageSearchBar.delegate = self
        self.imageSearchBar.backgroundImage = UIImage()
    }
    
    func setupImagesTableView() {
        self.addSubview(self.imagesTableView)
        self.imagesTableView.snp.makeConstraints { make in
            make.top.equalTo(self.imageSearchBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        self.imagesTableView.register(ImageTableViewCell.self,
                                      forCellReuseIdentifier: ImageTableViewCell.identifier)
        self.imagesTableView.dataSource = self
        self.imagesTableView.delegate = self
        self.imagesTableView.tableFooterView = UIView()
    }
}
