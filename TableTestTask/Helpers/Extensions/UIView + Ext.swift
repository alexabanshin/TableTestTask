//
//  UIView + Ext.swift
//  TableTestTask
//
//  Created by Alexander Abanshin on 23.07.25.
//

import UIKit

extension UIView {
    func addView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
}
