//
//  GradientBackground.swift
//  Gliese_581
//
//  Created by Павел Кузин on 17.12.2020.
//

import UIKit

extension UIView {
    
    func setGradientBackground(topColor : UIColor, botomColor: UIColor) {
        let gradientLayer               = CAGradientLayer()
        gradientLayer.frame             = bounds
        gradientLayer.locations         = [0.0, 1.0]
        gradientLayer.startPoint        = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint          = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors            = [topColor.cgColor, botomColor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBackground(upColor : UIColor, downColor: UIColor) {
        let gradientLayer               = CAGradientLayer()
        gradientLayer.frame             = bounds
        gradientLayer.locations         = [0.0, 1.0]
        gradientLayer.startPoint        = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint          = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors            = [upColor.cgColor, downColor.cgColor]
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
