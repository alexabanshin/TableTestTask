//
//  DetailViewController.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import SnapKit
import UIKit

final class DetailViewController: BaseViewController {
    private let tableView = DetailTableView()
    private let viewModel = DetailViewModel()
    
    var onModelUpdate: ((User) -> Void)?
    
}

extension DetailViewController {
    override func setupViews() {
        setupTable()
        setupNavigation()
    }
    
    override func constraintViews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

private extension DetailViewController {
    func setupTable() {
        tableView.configure(with: viewModel)
        view.addView(tableView)
    }
    
    func setupNavigation() {
        title = "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        StorageManager.shared.save(user: viewModel.user)
        onModelUpdate?(viewModel.user)
        showSaveAlert()
    }
    
    func showSaveAlert() {
        let alert = UIAlertController(title: nil, message: "Data saved!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
