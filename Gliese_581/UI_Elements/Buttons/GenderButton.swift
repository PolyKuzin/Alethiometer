//
//  GenderButton.swift
//  Gliese_581
//
//  Created by Павел Кузин on 08.12.2020.
//

import UIKit

extension UIButton {
    
    func setMaleButton(on view: UIView) {
        frame = CGRect(x: 0, y: 0, width: 156, height: 156)
        backgroundColor = .white
        backgroundColor = UIColor.darkBackground
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 30),
            self.widthAnchor.constraint(equalTo: self.heightAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    func setFemaleButton(on view: UIView) {
        frame = CGRect(x: 0, y: 0, width: 156, height: 156)
        backgroundColor = .white
        backgroundColor = UIColor.darkBackground
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 30),
            self.widthAnchor.constraint(equalTo: self.heightAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
