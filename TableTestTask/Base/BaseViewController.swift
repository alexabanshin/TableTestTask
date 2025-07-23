//
//  BaseViewController.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        setupViews()
        constraintViews()
    }
}

@objc extension BaseViewController {
    func setupViews() {}
    func constraintViews() {}
}
