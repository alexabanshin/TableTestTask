//
//  CellConfigurator.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import Foundation

enum CellConfigurator: Int, CaseIterable {
    case firstName, lastName, birthDate, gender
    
    var title: String {
        switch self {
        case .firstName:
            return "Имя"
        case .lastName:
            return "Фамилия"
        case .birthDate:
            return "Дата рождения"
        case .gender:
            return "Пол"
        }
    }
    
    func value(for user: User) -> String {
        switch self {
        case .firstName:
            return user.name
        case .lastName:
            return user.lastName
        case .birthDate:
            return user.birthDate
        case .gender:
            return user.gender
        }
    }
}
