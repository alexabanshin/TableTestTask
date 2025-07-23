//
//  GenderCell.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import SnapKit
import UIKit

class GenderCell: BaseCell {
    private let titleLabel = UILabel()
    private let valueTextField = UITextField()
    private let pickerView = UIPickerView()
    private let pickerOptions = ["Not selected", "Male", "Female"]
    
    var onValueUpdate: ((String) -> Void)?
    
    func configure(with configurator: CellConfigurator, value: String) {
        titleLabel.text = configurator.title
        
    }
}

extension GenderCell {
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

private extension GenderCell {
    func setupTitel() {
        titleLabel.text = "This is a title"
    }
    
    func setupValue() {
        valueTextField.placeholder = "Select gender"
        valueTextField.textAlignment = .right
        valueTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
}

extension GenderCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerOptions.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let value = pickerOptions[row]
        valueTextField.text = value
        valueTextField.resignFirstResponder()
        onValueUpdate?(value)
    }
}
