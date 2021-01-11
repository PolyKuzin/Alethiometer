//
//  DatePicker.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

extension UIDatePicker {
    
    func setDatePicker(on view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
