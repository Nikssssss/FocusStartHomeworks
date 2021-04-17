//
//  CarListViewController.swift
//  CarRecorder
//
//  Created by Никита Гусев on 16.04.2021.
//

import UIKit
import SnapKit

class CarListViewController: UIViewController {

    var presenter: CarListPresenterProtocol!
    
    private var cars: [Car]?
    
    private let carsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //TODO: call presenter to revalidate cars
    }

}

extension CarListViewController: CarListViewControllerProtocol {
    func configureView(using cars: [Car]?) {
        self.cars = cars
        self.setupView()
    }
}

extension CarListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarTableViewCell.identifier,
                                                 for: indexPath) as! CarTableViewCell
        if let cars = cars {
            let currentCar = cars[indexPath.row]
            cell.setManufacture(to: currentCar.manufacturer)
            cell.setModel(to: currentCar.model)
            cell.setBody(to: currentCar.body)
            if let yearOfIssue = currentCar.yearOfIssue {
                cell.setYearOfIssue(to: String(yearOfIssue))
            } else {
                cell.setYearOfIssue(to: "-")
            }
        }
        return cell
    }
}

extension CarListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135;
    }
}
 
private extension CarListViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupNavigationBar()
        self.setupCarsTableView()
    }
    
    func setupNavigationBar() {
        let addCarButton = UIBarButtonItem()
        addCarButton.title = "Добавить"
        addCarButton.target = self
        addCarButton.action = #selector(self.addCarButtonPressed)
        self.navigationItem.rightBarButtonItem = addCarButton
        
        let filterButton = UIBarButtonItem()
        filterButton.target = self
        filterButton.title = "Фильтры"
        filterButton.action = #selector(self.filterButtonPressed)
        self.navigationItem.leftBarButtonItem = filterButton
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "Список машин"
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupCarsTableView() {
        self.view.addSubview(self.carsTableView)
        self.carsTableView.snp.makeConstraints { (make) in
            make.right.bottom.left.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        self.carsTableView.register(CarTableViewCell.self,
                                    forCellReuseIdentifier: CarTableViewCell.identifier)
        self.carsTableView.delegate = self
        self.carsTableView.dataSource = self
        self.carsTableView.backgroundColor = .white
        self.carsTableView.separatorStyle = .none
        self.carsTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func addCarButtonPressed() {
        self.presenter.addCarButtonPressed()
    }
    
    @objc func filterButtonPressed() {
        
    }
}
