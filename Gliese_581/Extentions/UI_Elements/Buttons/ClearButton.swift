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
        setTitleColor         (UIColor.clearButtonText, for: .normal)
        layer.cornerRadius    = 15
        layer.masksToBounds   = true
        backgroundColor       = UIColor.grey
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
