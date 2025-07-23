//
//  ViewController.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import SnapKit
import UIKit

final class MainViewController: BaseViewController {
     let tableView = MainTableView()
    
}

extension MainViewController {
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

private extension MainViewController {
    func setupTable() {
        view.addView(tableView)
    }
    
    func setupNavigation() {
        title = "User info"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(didTapEdit))
    }
    
    @objc func didTapEdit() {
        let vc = DetailViewController()
        vc.onModelUpdate = { [weak self] user in
            self?.tableView.configure(with: user)
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

