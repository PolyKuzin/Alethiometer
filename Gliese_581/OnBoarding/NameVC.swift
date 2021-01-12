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
    var explanationLabel = UILabel()
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.alpha = 0.3
        nextButton.isEnabled = false
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
        if !isEditMode {
            self.view.addSubview(skipButton)
            skipButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                skipButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
                skipButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
                skipButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
            skipButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
            skipButton.setTitle("Skip".localized(), for: .normal)
            skipButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        }
        explanationLabel.setupexplanationLabel(on: self.view)
        NSLayoutConstraint.activate([
            explanationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            explanationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            explanationLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10)
        ])
        explanationLabel.text = "How can we call you?".localized()
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1),
                                                                              NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Medium", size: 18)!])
        if isEditMode {
            nameTextField.text = UserDefaults.standard.string(forKey: "UserName")!
            nextButton.setTitle("Save".localized(), for: .normal)
        }
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
        if isEditMode {
            if let name = nameTextField.text {
                UserDefaults.standard.setValue(name, forKey: "UserName")
                AnalyticsService.reportEvent(with: "UserName-Changed", parameters: ["UserName" : name])
            } else {
                UserDefaults.standard.setValue("", forKey: "UserName")
                AnalyticsService.reportEvent(with: "UserName-Changed", parameters: ["UserName" : "Не указал имя"])
            }
            let alert = UIAlertController(title: "Your name has changed!", message: "It will be changed on main screen)".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks)", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        } else {
            let vc = RelationShipsVC()
            guard let navigationController = navigationController else { return }
            navigationController.pushViewController(vc, animated: true)
            if let name = nameTextField.text {
                UserDefaults.standard.setValue(name, forKey: "UserName")
                AnalyticsService.reportEvent(with: "UserName", parameters: ["UserName" : name])
            } else {
                UserDefaults.standard.setValue("", forKey: "UserName")
                AnalyticsService.reportEvent(with: "UserName", parameters: ["UserName" : "Не указал имя"])
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func hideKeyboard() {
        self.view.endEditing(true)
    }
}
