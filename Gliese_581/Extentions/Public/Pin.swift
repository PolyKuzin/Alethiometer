//
//  UIView.swift
//  Gliese_581
//
//  Created by Павел Кузин on 24.12.2020.
//

import UIKit

extension UIView {
    
    typealias EdgeClosure = (_ view: UIView, _ superview: UIView) -> ([NSLayoutConstraint])
    
    // MARK: - Constraints
    /**
     Method **adds** a view to the superView, seted translatesAutoresizingMaskIntoConstraints to **false** and activates constrates
     - parameters:
        - on: View on which view schould be fixed
     */
    func pin(on superview: UIView, _ callback: EdgeClosure) {
        superview.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        callback(self, superview).forEach {
            $0.isActive = true
        }
    }
}
