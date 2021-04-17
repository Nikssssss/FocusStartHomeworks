//
//  CarViewController.swift
//  CarRecorder
//
//  Created by Никита Гусев on 17.04.2021.
//

import UIKit
import SnapKit

class CarViewController: UIViewController {

    var presenter: CarPresenterProtocol!
    
    private let manufactureTextField = UITextField()
    private let modelTextField = UITextField()
    private let bodyTextField = UITextField()
    private let yearOfIssueTextField = UITextField()
    private let carNumberTextField = UITextField()
    private let addCarButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.configureView()
    }

}

extension CarViewController: CarViewControllerProtocol {
    func configureView() {
        
    }
}

private extension CarViewController {
    func setupView() {
        
    }
    
    func setupNavigationBar() {
        let cancelButton = UIBarButtonItem()
        cancelButton.title = "Отменить"
        cancelButton.action = #selector(self.cancelButtonPressed)
        self.navigationItem.leftBarButtonItem = cancelButton
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "Добавление машины"
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupTextFieldWithLabel(_ textField: UITextField, named labelName: String) {
        let label = UILabel()
        label.text = labelName
        self.view.addSubview(label)
        view.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(label).offset(5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
    }
    
    func setupPickerView() {
        
    }
    
    @objc func cancelButtonPressed() {
        
    }
}
