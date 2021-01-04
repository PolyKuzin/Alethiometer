//
//  CityOfBirsthVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class CityOfBirsthVC: BaseVC, UITextFieldDelegate {

    let label = UILabel()

    var nextButton = UIButton()
    
    var cityTextField = UITextField()
    
    var nextFFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tap)
        label.setTitleLabel(on: view)
        label.text = "Your city of birth"
        nextButton.setNextButton(on: view)
        cityTextField.delegate = self
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        cityTextField.setBigTextField(on: self.view)
        cityTextField.placeholder = "City"
        NSLayoutConstraint.activate([
            cityTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 120),
            cityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = GenderVC()
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
