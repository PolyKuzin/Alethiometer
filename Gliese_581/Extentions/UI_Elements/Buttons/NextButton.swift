//
//  NextButton.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

extension UIButton {
    
    func setNextButton(on view: UIView) {
        frame                 = CGRect(x: 0, y: 0, width: 500, height: 65)
        titleLabel?.font      = Fonts.displayMedium18
        layer.masksToBounds   = true
        setTitle              ("Next", for: .normal)
        setTitleColor         (UIColor.white, for: .normal)
        layer.cornerRadius = 21
        setGradientBackground(colorOne: UIColor.buttonUp, colorTwo: UIColor.buttonDown)
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 65),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -65),
        ])
    }
}
