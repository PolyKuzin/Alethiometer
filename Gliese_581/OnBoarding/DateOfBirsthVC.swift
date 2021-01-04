//
//  DateOfBirsthVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class DateOfBirsthVC: BaseVC {

    let label = UILabel()

    var nextButton = UIButton()
    
    var datePickere = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.setTitleLabel(on: view)
        label.text = "Your date of birth"
        
        datePickere.setDatePicker(on: view)
        datePickere.preferredDatePickerStyle = .wheels
        datePickere.datePickerMode = .date
        datePickere.setValue(UIColor.white, forKeyPath: "textColor")
        datePickere.setDate(Date(timeIntervalSince1970: 908608500), animated: true)
        datePickere.minimumDate = Date(timeIntervalSince1970: -315630000)
        datePickere.maximumDate = Date(timeIntervalSince1970: 1136062800)

        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)

    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = TimeOfBirsthVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)

    }
}
