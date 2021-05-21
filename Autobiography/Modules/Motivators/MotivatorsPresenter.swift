//
//  MotivatorsPresenter.swift
//  Autobiography
//
//  Created by Никита Гусев on 21.05.2021.
//

import Foundation

protocol MotivatorsCellPresenterProtocol {
    func viewDidLoad()
}

class MotivatorCellPresenter {
    let motivatorsService: MotivatorsServiceProtocol
    
    init(motivatorsService: MotivatorsServiceProtocol) {
        self.motivatorsService = motivatorsService
    }
}

extension MotivatorCellPresenter: MotivatorsCellPresenterProtocol {
    func viewDidLoad() {
        
    }
}
