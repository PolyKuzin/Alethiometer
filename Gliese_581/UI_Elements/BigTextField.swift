//
//  BigTextField.swift
//  Gliese_581
//
//  Created by Павел Кузин on 08.12.2020.
//

import UIKit

extension UITextField {
    
    func setBigTextField(on view: UIView) {
        frame                        = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 66)
        layer.cornerRadius           = 17
        backgroundColor              = UIColor.darkBackground
        font                         = UIFont.displayMedium24
        layer.borderWidth            = 0
        leftView                     = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 66))
        leftViewMode                 = .always
        autocorrectionType           = UITextAutocorrectionType.yes
        keyboardType                 = UIKeyboardType.default
        returnKeyType                = UIReturnKeyType.continue
        clearButtonMode              = UITextField.ViewMode.whileEditing
        isSecureTextEntry            = false
        autocapitalizationType       = .sentences
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            self.heightAnchor.constraint(equalToConstant: 66)
        ])
    }
}
