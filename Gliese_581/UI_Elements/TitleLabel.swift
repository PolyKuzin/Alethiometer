//
//  TitleLabel.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

extension UILabel {
    
    func setTitleLabel(on view: UIView) {
        textColor = UIColor(red: 0.426, green: 0.69, blue: 1, alpha: 1)
        font = UIFont(name: "SFProDisplay-Semibold", size: 24)
        textAlignment = .center
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topAnchor.constraint(equalTo: view.topAnchor, constant: 25),
        ])
    }
}
