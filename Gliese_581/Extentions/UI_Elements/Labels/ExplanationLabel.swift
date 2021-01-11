//
//  ExplanationLabel.swift
//  Gliese_581
//
//  Created by Павел Кузин on 11.01.2021.
//

import UIKit

extension UILabel {
    
    func setupexplanationLabel(on view: UIView) {
        textColor = UIColor(red: 0.613, green: 0.613, blue: 0.613, alpha: 1)
        font = UIFont(name: "SFProDisplay-Regular", size: 14)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
