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
        view.addView(tableView)
    }
    
    func setupNavigation() {
        title = "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
    }
    
    @objc func didTapSave() {
        print("Save taped")
    }
    
}
