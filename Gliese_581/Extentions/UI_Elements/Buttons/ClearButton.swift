//
//  ClearButton.swift
//  Gliese_581
//
//  Created by Павел Кузин on 08.12.2020.
//

import UIKit

extension UIButton {
    
    func setClearButton(on view: UIView) {
        frame                 = CGRect(x: 0, y: 0, width: 200, height: 50)
        titleLabel?.font      = Fonts.displayMedium20
        setTitle              ("I don't know", for: .normal)
        setTitleColor         (UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        layer.cornerRadius    = 15
        layer.masksToBounds   = true
        backgroundColor       = UIColor(red: 0.239, green: 0.235, blue: 0.267, alpha: 1)
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
