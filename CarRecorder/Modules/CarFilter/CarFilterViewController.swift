//
//  CarFilterFilterViewController.swift
//  CarFilterRecorder
//
//  Created by Никита Гусев on 19.04.2021.
//

import UIKit

class CarFilterViewController: UIViewController {
    var presenter: CarFilterPresenterProtocol!
    var embeddedInNavigationController: UINavigationController {
        return UINavigationController(rootViewController: self)
    }
    var completionHandler: ((Body?) -> Void)!
    
    private let bodyPickerView = UIPickerView()
    
    private var bodyFilters: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configureView()
    }

}

extension CarFilterViewController: CarFilterViewControllerProtocol {
    func configureView(using bodyFilters: [String]) {
        self.bodyFilters = bodyFilters
        self.setupView()
    }
    
    func getSelectedFilter() -> String? {
        guard let bodyFilters = bodyFilters else {
            return nil
        }
        let selectedIndex = self.bodyPickerView.selectedRow(inComponent: 0)
        return bodyFilters[selectedIndex]
    }
}

extension CarFilterViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let bodyFilters = self.bodyFilters else {
            return nil
        }
        return bodyFilters[row]
    }
}

extension CarFilterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.bodyFilters?.count ?? 0
    }
}

private extension CarFilterViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupNavigationBar()
        self.setupBodyPickerView()
    }
    
    func setupNavigationBar() {
        let readyButton = UIBarButtonItem()
        readyButton.title = CarFilterConstants.readyButtonTitle
        readyButton.target = self
        readyButton.action = #selector(self.readyButtonPressed)
        self.navigationItem.rightBarButtonItem = readyButton
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = CarFilterConstants.navigationItemTitle
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupBodyPickerView() {
        self.view.addSubview(self.bodyPickerView)
        self.bodyPickerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        self.bodyPickerView.dataSource = self
        self.bodyPickerView.delegate = self
    }
    
    @objc func readyButtonPressed() {
        self.presenter.readyButtonPressed()
    }
}
