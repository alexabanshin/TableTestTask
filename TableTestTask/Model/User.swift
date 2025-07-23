//
//  User.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import Foundation

struct User {
    let name: String
    let lastName: String
    let birthDate: String
    let gender: String
}

enum Gender: String {
    case notSelected = "Not slected"
    case male = "Male"
    case female = "Female"
}
