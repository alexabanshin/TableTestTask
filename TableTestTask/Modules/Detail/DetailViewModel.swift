//
//  DetailViewModel.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import Foundation

protocol DetailViewModelDelegate: AnyObject {
    var onValueUpdate: ((String) -> Void)? { get set }
}

class DetailViewModel {
    var user: User
    
    init() {
        if let user = StorageManager.shared.loadUser() {
            self.user = user
        } else {
            user = User()
        }
    }
    
    weak var delegate: DetailViewModelDelegate?
    
    var onValueUpdate: ((String) -> Void)?
    
    func update(value: String, for field: CellConfigurator) {
        switch field {
        case .firstName:
            user.name = value
        case.lastName:
            user.lastName = value
        case.birthDate:
            user.birthDate = value
        case.gender:
            user.gender = value
        }
    }
    

    
}
