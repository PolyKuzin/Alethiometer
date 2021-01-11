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
        titleLabel?.font = UIFont.displaySemibold20
        setTitleColor         (UIColor.background, for: .normal)
        layer.cornerRadius = 21
        setGradientBackground(colorOne: UIColor(red: 0.734, green: 0.627, blue: 0.419, alpha: 1), colorTwo: UIColor(red: 1, green: 0.871, blue: 0.622, alpha: 1))
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 65),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -55),
        ])
    }
}
