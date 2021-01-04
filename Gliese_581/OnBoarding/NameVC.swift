//
//  NameVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class NameVC: BaseVC {

    let label = UILabel()

    var nextButton = UIButton()
    
    var nameTextField = UITextField()
    
    var nextFFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
        
        label.setTitleLabel(on: view)
        label.text = "Your name"
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)

        nameTextField.placeholder = "Name"
        nameTextField.setBigTextField(on: view)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 120),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = RelationShipsVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc
    func keyboardWillShow(sender: NSNotification) {
        nextFFrame = nextButton.frame
        self.nextButton.frame.origin.y = nextFFrame.origin.y - 200 // Move view 150 points upward
    }

    @objc
    func keyboardWillHide(sender: NSNotification) {
        self.nextButton.frame.origin.y = nextFFrame.origin.y // Move view to original position
    }
}
