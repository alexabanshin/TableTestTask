//
//  MainTableView.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import SnapKit
import UIKit

class MainTableView: BaseTableView {
    private var user = User() {
        didSet {
            reloadData()
        }
    }
  
    func configure(with user: User) {
        self.user = user
    }
    

}

extension MainTableView {
    override func setupView() {
        setupTable()
    }

    override func constraintViews() {

    }
}

private extension MainTableView {
    func setupTable() {
        dataSource = self
        delegate = self
        register(MainCell.self)        
    }
}

extension MainTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CellConfigurator.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = CellConfigurator(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        
        switch cellType {
        case .firstName:
            let cell = tableView.dequeCell(for: MainCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        case .lastName:
            let cell = tableView.dequeCell(for: MainCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        case .birthDate:
            let cell = tableView.dequeCell(for: MainCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        case .gender:
            let cell = tableView.dequeCell(for: MainCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        }

    }
    
}
extension MainTableView: UITableViewDelegate {
    
}
