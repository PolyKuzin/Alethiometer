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
    var backButton = UIButton()
    var skipButton = UIButton()

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
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        nameTextField.addTarget(self, action: #selector(actionTextFieldIsEditingChanged), for: .editingChanged)
        self.view.addSubview(skipButton)
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skipButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            skipButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            skipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        skipButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        skipButton.setTitle("Skip".localized(), for: .normal)
        skipButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
    }
    
    @objc
    private func actionTextFieldIsEditingChanged(sender: UITextField) {
         if let text = sender.text {
            if !text.isEmpty {
                nextButton.alpha = 1
                nextButton.isEnabled = true
            } else {
                nextButton.alpha = 0.3
                nextButton.isEnabled = false
            }
         } else {
            nextButton.alpha = 0.3
            nextButton.isEnabled = false
        }
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = RelationShipsVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        if let name = nameTextField.text {
            UserDefaults.standard.setValue(name, forKey: "UserName")
            AnalyticsService.reportEvent(with: "UserName", parameters: ["UserName" : name])
        }
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
