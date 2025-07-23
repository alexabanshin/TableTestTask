//
//  NameCell.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import SnapKit
import UIKit

class NameCell: BaseCell {
    private let titleLabel = UILabel()
    private let valueTextField = UITextField()
    
    var onValueUpdate: ((String) -> Void)?
    
    func configure(with configurator: CellConfigurator, value: String) {
        titleLabel.text = configurator.title
        valueTextField.text = value
    }
}

extension NameCell {
    override func setupView() {
        contentView.addView(titleLabel)
        contentView.addView(valueTextField)
        
        setupTitel()
        setupValue()
    }
    
    override func constraintViews() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        valueTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
    }
}

private extension NameCell {
    func setupTitel() {
        titleLabel.text = "This is a title"
    }
    
    func setupValue() {
        valueTextField.placeholder = "Enter value"
        valueTextField.textAlignment = .right
        valueTextField.addTarget(self, action: #selector(valueLabelChanged), for: .editingChanged)
        
    }
    
    @objc func valueLabelChanged() {
        onValueUpdate?(valueTextField.text ?? "No name")
        
    }
    
  
}


