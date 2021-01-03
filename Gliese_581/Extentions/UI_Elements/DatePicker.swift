//
//  DatePicker.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

extension UIDatePicker {
    
    func setDatePicker(on view: UIView) {
//        backgroundColor = .clear
//        tintColor = .white//UIColor(red: 0.281, green: 0.289, blue: 0.359, alpha: 1)
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            topAnchor.constraint(equalTo: view.topAnchor, constant: 125),
        ])
    }
}
