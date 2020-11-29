//
//  TimeOfBirsthVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class TimeOfBirsthVC: BaseVC {
    
    let label = UILabel()

    var nextButton = UIButton()
    
    var datePickere = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        label.setTitleLabel(on: view)
        label.text = "Your time of birth"
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        datePickere.setDatePicker(on: view)
        datePickere.preferredDatePickerStyle = .wheels
        datePickere.datePickerMode = .time
        datePickere.setDate(Date(timeIntervalSince1970: 908608500), animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = CityOfBirsthVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)

    }
}
