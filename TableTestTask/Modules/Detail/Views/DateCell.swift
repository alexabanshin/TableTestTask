//
//  dateCell.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import SnapKit
import UIKit

class DateCell: BaseCell {
    private let titleLabel = UILabel()
    private let valueDatePicker = UIDatePicker()
    
    func configure(with configurator: CellConfigurator, value: String) {
        titleLabel.text = configurator.title
        
    }
    
}

extension DateCell {
    override func setupView() {
        contentView.addView(titleLabel)
        contentView.addView(valueDatePicker)
        
        setupTitel()
        setupValue()
    }
    
    override func constraintViews() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        valueDatePicker.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
    }
}

private extension DateCell {
    func setupTitel() {
        titleLabel.text = "This is a title"
    }
    
    func setupValue() {
        valueDatePicker.datePickerMode = .date
        valueDatePicker.preferredDatePickerStyle = .compact
        valueDatePicker.addTarget(self, action: #selector(didSelectDate), for: .editingDidEnd)
    }
    
    @objc func didSelectDate() {
        print("Date was selected")
    }
}
