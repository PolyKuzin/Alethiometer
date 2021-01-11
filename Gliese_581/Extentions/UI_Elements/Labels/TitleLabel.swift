//
//  TitleLabel.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

extension UILabel {
    
    func setTitleLabel(on view: UIView) {
        textColor = UIColor.main
        font = UIFont(name: "SFProDisplay-Bold", size: 32)
        textAlignment = .center
        numberOfLines = 0
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
    }
}
