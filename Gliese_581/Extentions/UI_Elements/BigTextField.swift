//
//  BigTextField.swift
//  Gliese_581
//
//  Created by Павел Кузин on 08.12.2020.
//

import UIKit

extension UITextField {
    
    func setBigTextField(on view: UIView) {
        frame                        = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 58)
        layer.cornerRadius           = 17
        backgroundColor              = UIColor(red: 0.239, green: 0.235, blue: 0.267, alpha: 1)
        font                         = UIFont(name: "SFProDisplay-Medium", size: 18)
        layer.borderWidth            = 0
        textColor = UIColor.white
//        placeholder?.toAttributed(color: UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), font: UIFont(name: "SFProDisplay-Medium", size: 18)!)
        leftView                     = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 58))
        leftViewMode                 = .always
        autocorrectionType           = UITextAutocorrectionType.yes
        keyboardType                 = UIKeyboardType.default
        returnKeyType                = UIReturnKeyType.next
        clearButtonMode              = UITextField.ViewMode.whileEditing
        isSecureTextEntry            = false
        autocapitalizationType       = .sentences
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            self.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
}
