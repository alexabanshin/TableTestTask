//
//  TableView + Ext.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func dequeCell<T: UITableViewCell>(for cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            print("Cannot deque cell with identifier: \(cellType.reuseIdentifier)")
            return T()
        }
        
        return cell
    }
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}
