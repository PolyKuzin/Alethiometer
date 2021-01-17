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
    var backButton = UIButton()
    var datePicker = UIDatePicker()
    var date = ""
    var changed = false {
        didSet {
            if changed {
                nextButton.isEnabled = true
                nextButton.alpha = 1
            }
        }
    }
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.setTitleLabel(on: view)
        label.text = "Your date of birth"
        datePicker.setDatePicker(on: view)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.setValue(false, forKey: "highlightsToday")
        datePicker.setDate(Date(timeIntervalSince1970: 908608500), animated: true)
        if isEditMode {
            datePicker.setDate(UserDefaults.standard.value(forKey: "DateOfBirth") as! Date, animated: true)
        }
        datePicker.minimumDate = Date(timeIntervalSince1970: -315630000)
        datePicker.maximumDate = Date()

        nextButton.isEnabled = false
        nextButton.alpha = 0.3
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        datePicker.addTarget(self, action: #selector(datehandler(sender:)), for: UIControl.Event.valueChanged)
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        if isEditMode {
            nextButton.setTitle("Save".localized(), for: .normal)
        }
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func datehandler(sender: UIDatePicker) {
        changed = true
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        date = timeFormatter.string(from: datePicker.date)
    }
    
    @objc
    private func goToDateOfBirthVC() {
        if isEditMode {
            UserDefaults.standard.setValue(datePicker.date, forKey: "DateOfBirth")
            AnalyticsService.reportEvent(with: "DateOfBirth-Changed", parameters: ["DateOfBirth" : date])
            let alert = UIAlertController(title: "Your date of birth has changed!", message: "It will be changed when you restart the app)".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks)", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        } else {
            let vc = TimeOfBirsthVC()
            guard let navigationController = navigationController else { return }
            navigationController.pushViewController(vc, animated: true)
            UserDefaults.standard.setValue(datePicker.date, forKey: "DateOfBirth")
            AnalyticsService.reportEvent(with: "DateOfBirth", parameters: ["DateOfBirth" : date])
            self.dismiss(animated: true, completion: nil)
        }
    }
}
