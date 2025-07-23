//
//  MainCell.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//
import SnapKit
import UIKit

class MainCell: BaseCell {
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()
    
    func configure(with configurator: CellConfigurator, value: String) {
        titleLabel.text = configurator.title
        valueLabel.text = value
    }
}

extension MainCell {
    override func setupView() {
        addView(titleLabel)
        addView(valueLabel)
        
        setupTitel()
        setupValue()
    }
    
    override func constraintViews() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
    }
}

private extension MainCell {
    func setupTitel() {
        titleLabel.text = "This is a title"
    }
    
    func setupValue() {
        valueLabel.text = "This is a value"
    }
}
