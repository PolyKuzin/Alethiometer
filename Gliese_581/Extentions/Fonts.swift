//
//  Fonts.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

struct Fonts {
    
    static let displayMedium18            = UIFont(name: "SFProDisplay-Medium",    size: 18)
    static let displayMedium20            = UIFont(name: "SFProDisplay-Medium",    size: 20)
    static let displayMedium22            = UIFont(name: "SFProDisplay-Medium",    size: 22)
    static let displaySemibold18        = UIFont(name: "SFProDisplay-Semibold", size: 18)
    static let displaySemibold22        = UIFont(name: "SFProDisplay-Semibold", size: 22)
    static let displaySemibold20        = UIFont(name: "SFProDisplay-Semibold", size: 20)
    static let displaySemibold28        = UIFont(name: "SFProDisplay-Semibold", size: 28)
    static let textRegular17            = UIFont(name: "SFProText-Regular",     size: 17)
    static let textRegular14            = UIFont(name: "SFProText-Regular",     size: 14)
    static let textSemibold17            = UIFont(name: "SFProText-Semibold",    size: 17)
    static let textSemibold14            = UIFont(name: "SFProText-Semibold",    size: 14)
    static let displayBold28            = UIFont(name: "SFProDisplay-Bold",     size: 28)
    static let textBold17                = UIFont(name: "SFProText-Bold",         size: 17)
    static let displayRegular17            = UIFont(name: "SFProDisplay-Regular",  size: 17)
    static let displayRegular18            = UIFont(name: "SFProDisplay-Regular",  size: 18)
}

extension UIFont {
    
    //MARK: - Display Regular
    public class var displayRegular17: UIFont {
        return UIFont(name: "SFProDisplay-Regular",  size: 17) ?? UIFont(name: "Helvetica Neue", size: 17)!
    }
    
    public class var displayRegular18: UIFont {
        return UIFont(name: "SFProDisplay-Regular",  size: 18) ?? UIFont(name: "Helvetica Neue", size: 18)!
    }
    
    //MARK: - Display Medium
    public class var displayMedium18: UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: 18) ?? UIFont(name: "Helvetica Neue", size: 18)!
    }
    
    public class var displayMedium20: UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: 20) ?? UIFont(name: "Helvetica Neue", size: 20)!
    }
    
    public class var displayMedium22: UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: 22) ?? UIFont(name: "Helvetica Neue", size: 22)!
    }
    
    public class var displayMedium24: UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: 24) ?? UIFont(name: "Helvetica Neue", size: 24)!
    }
    
    //MARK: - Display Semibold
    public class var displaySemibold18: UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: 18) ?? UIFont(name: "Helvetica Neue", size: 18)!
    }
    
    public class var displaySemibold20: UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: 20) ?? UIFont(name: "Helvetica Neue", size: 20)!
    }
    
    public class var displaySemibold22: UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: 22) ?? UIFont(name: "Helvetica Neue", size: 22)!
    }
    
    public class var displaySemibold28: UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: 28) ?? UIFont(name: "Helvetica Neue", size: 28)!
    }
    
    //MARK: - Display Bold
    public class var displayBold28: UIFont {
        return UIFont(name: "SFProDisplay-Bold",     size: 28) ?? UIFont(name: "Helvetica Neue", size: 28)!
    }
    
    public class var displayBold34: UIFont {
        return UIFont(name: "SFProDisplay-Bold",     size: 34) ?? UIFont(name: "Helvetica Neue", size: 34)!
    }
    
    //MARK: - TEXT Regular
    public class var textRegular14: UIFont {
        return UIFont(name: "SFProText-Regular",     size: 14) ?? UIFont(name: "Helvetica Neue", size: 14)!
    }
    
    public class var textRegular17: UIFont {
        return UIFont(name: "SFProText-Regular",     size: 17) ?? UIFont(name: "Helvetica Neue", size: 17)!
    }
    
    //MARK: - TEXT Semibold
    public class var textSemibold14: UIFont {
        return UIFont(name: "SFProText-Semibold",    size: 14) ?? UIFont(name: "Helvetica Neue", size: 14)!
    }
    
    public class var textSemibold17: UIFont {
        return UIFont(name: "SFProText-Semibold",    size: 17) ?? UIFont(name: "Helvetica Neue", size: 17)!
    }
    
    public class var textSemibold20: UIFont {
        return UIFont(name: "SFProText-Semibold",    size: 20) ?? UIFont(name: "Helvetica Neue", size: 20)!
    }
    
    //MARK: - TEXT Bold
    public class var textBold17: UIFont {
        return UIFont(name: "SFProText-Bold",         size: 17) ?? UIFont(name: "Helvetica Neue", size: 17)!
    }
}
