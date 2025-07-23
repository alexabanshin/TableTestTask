//
//  User.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import Foundation

struct User {
    var name: String
    var lastName: String
    var birthDate: String
    var gender: String
}

enum Gender: String {
    case notSelected = "Not slected"
    case male = "Male"
    case female = "Female"
}
