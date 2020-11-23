//
//  Colors.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

extension UIColor {
    
    public class var buttonUp: UIColor {
        return UIColor(named: "Button's_Up") ?? UIColor.cyan
    }
    
    public class var buttonDown: UIColor {
        return UIColor(named: "Button's_Down") ?? UIColor.cyan
    }
    
    public class var background: UIColor {
        return UIColor(named: "Background") ?? UIColor.black
    }
    
    public class var main: UIColor {
        return UIColor(named: "Main") ?? UIColor.cyan
    }
}
