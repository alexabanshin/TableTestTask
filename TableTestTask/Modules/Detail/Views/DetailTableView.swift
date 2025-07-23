//
//  DetailTableView.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import UIKit

class DetailTableView: BaseTableView {
    private let user: User = .init(name: "Alexander", lastName: "Abanshin", birthDate: "10.10.1993", gender: "Male")
}

extension DetailTableView {
    override func setupView() {
        setupTable()
    }
    override func constraintViews() {
        
    }
}

private extension DetailTableView {
    func setupTable() {
        register(NameCell.self)
        register(DateCell.self)
        register(GenderCell.self)
        
        dataSource = self
        delegate = self
    }
}

extension DetailTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CellConfigurator.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = CellConfigurator(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        
        switch cellType {
        case .firstName, .lastName:
            let cell = tableView.dequeCell(for: NameCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        case .birthDate:
            let cell = tableView.dequeCell(for: DateCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        case .gender:
            let cell = tableView.dequeCell(for: GenderCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: user))
            return cell
        }
    }
    
}
extension DetailTableView: UITableViewDelegate {
    
}

