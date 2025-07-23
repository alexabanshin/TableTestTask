//
//  BaseCell.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import UIKit

class BaseCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
        constraintViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

@objc extension BaseCell {
    func setupView() {

    }
    func constraintViews() {}
}
