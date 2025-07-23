//
//  StorageManager.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import Foundation

final class StorageManager {
    private let userDefaults = UserDefaults.standard
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    static let shared = StorageManager()
    
    private init() {}
    
    func save(user: User) {
        if let encodeUser = try? encoder.encode(user) {
            userDefaults.set(encodeUser, forKey: "user")
        }
    }
    
    func loadUser() -> User? {
        if let encodedUser = userDefaults.data(forKey: "user") {
            let user =  try? decoder.decode(User.self, from: encodedUser)
            print("user decoded")
            return user
        }
        print("user not decoded")
        return nil
    }
}
