//
//  DetailTableView.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import UIKit

final class DetailTableView: BaseTableView {
    private var viewModel: DetailViewModel!
    
    func configure(with viewModel: DetailViewModel) {
        self.viewModel = viewModel
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
            cell.configure(with: cellType, value: cellType.value(for: viewModel.user))
            cell.onValueUpdate = { [weak self] value in
                self?.viewModel.update(value: value, for: cellType)
            }
            return cell
        case .birthDate:
            let cell = tableView.dequeCell(for: DateCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: viewModel.user))
            cell.onValueUpdate = { [weak self] value in
                self?.viewModel.update(value: value, for: cellType)
            }
            return cell
        case .gender:
            let cell = tableView.dequeCell(for: GenderCell.self, indexPath: indexPath)
            cell.configure(with: cellType, value: cellType.value(for: viewModel.user))
            cell.onValueUpdate = { [weak self] value in
                self?.viewModel.update(value: value, for: cellType)
            }
            return cell
        }
    }
    
}
extension DetailTableView: UITableViewDelegate {
    
}

extension DetailTableView {
    override func setupView() {
        register(NameCell.self)
        register(DateCell.self)
        register(GenderCell.self)
        
        dataSource = self
        delegate = self
    }
}
