//
//  TimeOfBirsthVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class TimeOfBirsthVC: BaseVC {
    
    var label = UILabel()
    var explanationLabel = UILabel()
    var nextButton = UIButton()
    var backButton = UIButton()
    var datePicker = UIDatePicker() {
        didSet {
            changed = true
        }
    }
    var clearButton = UIButton()
    var date = ""
    var skipButton = UIButton()
    
    var changed = false {
        didSet {
            if changed {
                nextButton.isEnabled = true
                nextButton.alpha = 1
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.setTitleLabel(on: view)
        label.text = "Your time of birth"
        
        nextButton.alpha = 0.3
        nextButton.isEnabled = false
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        
        datePicker.setDatePicker(on: view)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .time
        datePicker.locale = Locale(identifier: "en_GB")
        datePicker.setDate(Date(timeIntervalSince1970: 908608500), animated: true)
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.addTarget(self, action: #selector(datehandler(sender:)), for: UIControl.Event.valueChanged)
        
        explanationLabel.setupexplanationLabel(on: self.view)
        NSLayoutConstraint.activate([
            explanationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            explanationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            explanationLabel.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: -5)
        ])
        
        explanationLabel.text = "We need to know your time of birth in order to make your natal chart correctly".localized()
        setupClearButton()
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func datehandler(sender: UIDatePicker) {
        changed = true
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        date = timeFormatter.string(from: datePicker.date)
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = CityOfBirsthVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        if date != "" {
            UserDefaults.standard.setValue(date, forKey: "TimeOfBirth")
            AnalyticsService.reportEvent(with: "TimeOfBirth", parameters: ["TimeOfBirth" : date])
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension TimeOfBirsthVC {
    
    func setupClearButton() {
        clearButton.setClearButton(on: self.view)
        clearButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 40),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 200),
            clearButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
