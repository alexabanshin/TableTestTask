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
    private let user: User
    
    init() {
        if let user = StorageManager.shared.loadUser() {
            self.user = user
        } else {
            user = User()
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
        tableView.configure(with: user)
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

