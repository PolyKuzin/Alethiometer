//
//  SettingsView.swift
//  Gliese_581
//
//  Created by Павел Кузин on 12.01.2021.
//

import UIKit

extension UIView {
    
    func setSettingsView(on view: UIView, leftText: String, rightText: String) {
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 80)
        backgroundColor = UIColor(red: 0.239, green: 0.235, blue: 0.267, alpha: 1)
        layer.cornerRadius = 20
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            self.heightAnchor.constraint(equalToConstant: 80),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let left = UILabel()
        left.text = leftText
        left.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        left.font = UIFont(name: "SFProDisplay-Semibold", size: 18)
        addSubview(left)
        left.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            left.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            left.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            left.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        let right = UILabel()
        right.text = rightText
        right.textColor = UIColor(red: 0.613, green: 0.613, blue: 0.613, alpha: 1)
        right.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        addSubview(right)
        right.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            right.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -31),
            right.topAnchor.constraint(equalTo: topAnchor, constant: 21),
            right.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21)
        ])
        
        let clickImage = UIImageView(image: UIImage(named: "chevron.right"))
        self.addSubview(clickImage)
        clickImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            clickImage.widthAnchor.constraint(equalToConstant: 7),
            clickImage.heightAnchor.constraint(equalToConstant: 12),
            clickImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            clickImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            clickImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
