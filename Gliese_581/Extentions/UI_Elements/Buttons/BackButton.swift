//
//  BackButton.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.01.2021.
//

import UIKit

extension UIButton {

    func setBackButton(on view: UIView) {
        self.frame  = CGRect(x: 0, y: 0, width: 13, height: 20)
        self.setImage(UIImage(named: "BackButton"), for: .normal)
//        backgroundColor = .purple
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 13).isActive = true
        self.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    }
}
