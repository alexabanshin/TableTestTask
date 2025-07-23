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
            return "Name"
        case .lastName:
            return "Last name"
        case .birthDate:
            return "Birth date"
        case .gender:
            return "Gender"
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
