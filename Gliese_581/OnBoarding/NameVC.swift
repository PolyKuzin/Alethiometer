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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
}
