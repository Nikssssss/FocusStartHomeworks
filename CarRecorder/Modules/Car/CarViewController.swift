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
    var embeddedInNavigationController: UINavigationController {
        let carNavigationController = UINavigationController(rootViewController: self)
        return carNavigationController
    }
    
    private let manufacturerTextField = UITextField()
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
    var manufacturer: String {
        return manufacturerTextField.text ?? ""
    }
    var model: String {
        return modelTextField.text ?? ""
    }
    var body: String {
        return bodyTextField.text ?? ""
    }
    var yearOfIssue: String? {
        if let text = yearOfIssueTextField.text, text.isEmpty == false {
            return text
        } else {
            return nil
        }
    }
    var carNumber: String? {
        if let text = carNumberTextField.text, text.isEmpty == false {
            return text
        } else {
            return nil
        }
    }
    
    func configureView() {
        self.setupView()
    }
    
    func hasBlankRequiredFields() -> Bool {
        if self.isEmptyTextField(self.manufacturerTextField)
            || self.isEmptyTextField(self.modelTextField)
            || self.isEmptyTextField(self.bodyTextField) {
            return true
        } else {
            return false
        }
    }
    
    func showErrorMessage(_ errorMessage: String) {
        let alert = UIAlertController(title: "Ошибка", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func clearAllFields() {
        manufacturerTextField.text?.removeAll()
        modelTextField.text?.removeAll()
        bodyTextField.text?.removeAll()
        yearOfIssueTextField.text?.removeAll()
        carNumberTextField.text?.removeAll()
    }
}

extension CarViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let allBodies = Body.allCases
        return allBodies.count
    }
}

extension CarViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let allBodies = Body.allCases
        return allBodies[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let allBodies = Body.allCases
        self.bodyTextField.text = allBodies[row].rawValue
    }
}

extension CarViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return false
    }
}

private extension CarViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.setupNavigationBar()
        self.setupLabelWithTextField(self.manufacturerTextField,
                                     named: "Производитель *",
                                     topAnchor: self.view)
        self.setupLabelWithTextField(self.modelTextField,
                                     named: "Модель *",
                                     topAnchor: self.manufacturerTextField.snp.bottom)
        self.setupLabelWithTextField(self.bodyTextField,
                                     named: "Тип кузова *",
                                     topAnchor: self.modelTextField.snp.bottom)
        self.setupLabelWithTextField(self.yearOfIssueTextField,
                                     named: "Год выпуска",
                                     topAnchor: self.bodyTextField.snp.bottom)
        self.setupLabelWithTextField(self.carNumberTextField,
                                     named: "Гос. номер",
                                     topAnchor: self.yearOfIssueTextField.snp.bottom)
        self.setupPickerView()
        self.setupAddCarButton()
    }
    
    func setupNavigationBar() {
        let cancelButton = UIBarButtonItem()
        cancelButton.title = "Отменить"
        cancelButton.target = self
        cancelButton.action = #selector(self.cancelButtonPressed)
        self.navigationItem.leftBarButtonItem = cancelButton
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationItem.title = "Добавление машины"
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
    func setupLabelWithTextField(_ textField: UITextField,
                                 named labelName: String,
                                 topAnchor: ConstraintRelatableTarget) {
        let label = UILabel()
        label.text = labelName
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { (make) in
            make.top.equalTo(topAnchor).offset(20)
            make.left.equalToSuperview().offset(20)
        }
        
        self.view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        textField.backgroundColor = UIColor(red: 240 / 255.0,
                                            green: 240 / 255.0,
                                            blue: 240 / 255.0,
                                            alpha: 1.0)
        textField.layer.cornerRadius = 5
        textField.autocorrectionType = .no
    }
    
    func setupPickerView() {
        let bodyPickerView = UIPickerView()
        bodyPickerView.dataSource = self
        bodyPickerView.delegate = self
        self.bodyTextField.inputView = bodyPickerView
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done",
                                     style: .plain,
                                     target: self,
                                     action: #selector(self.dismissPickerView))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.bodyTextField.inputAccessoryView = toolBar
        
        self.bodyTextField.delegate = self
    }
    
    func setupAddCarButton() {
        self.addCarButton.setTitle("Добавить", for: .normal)
        self.view.addSubview(self.addCarButton)
        self.addCarButton.translatesAutoresizingMaskIntoConstraints = false
        self.addCarButton.snp.makeConstraints { make in
            make.top.equalTo(self.carNumberTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(45)
        }
        self.addCarButton.layer.cornerRadius = 10
        self.addCarButton.addTarget(self,
                                    action: #selector(self.addCarButtonPressed),
                                    for: .touchUpInside)
        self.addCarButton.setTitleColor(.darkGray,
                                        for: .normal)
        self.addCarButton.layer.borderWidth = 0.5
    }
    
    func isEmptyTextField(_ textField: UITextField) -> Bool {
        if let text = textField.text, text.isEmpty == false {
            return false
        } else {
            return true
        }
    }
    
    @objc func cancelButtonPressed() {
        self.presenter.cancelButtonPressed()
    }
    
    @objc func dismissPickerView() {
        self.view.endEditing(true)
    }
    
    @objc func addCarButtonPressed() {
        self.presenter.addCarButtonPressed()
    }
}
