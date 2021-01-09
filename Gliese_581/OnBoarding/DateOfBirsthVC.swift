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
//    var skipButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.setTitleLabel(on: view)
        label.text = "Your date of birth"
        
        datePicker.setDatePicker(on: view)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.setDate(Date(timeIntervalSince1970: 908608500), animated: true)
        datePicker.minimumDate = Date(timeIntervalSince1970: -315630000)
        datePicker.maximumDate = Date(timeIntervalSince1970: 1136062800)

        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        datePicker.addTarget(self, action: #selector(datehandler(sender:)), for: UIControl.Event.valueChanged)
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func datehandler(sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = DateFormatter.Style.short
        date = timeFormatter.string(from: datePicker.date)
    }
    
//    override func viewDidDisappear(_ animated: Bool)    {
//        super.viewWillDisappear(animated)
//        guard let navigationController = navigationController else { return }
//        navigationController.viewControllers.removeAll(where: { self === $0 })
//    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = TimeOfBirsthVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        UserDefaults.standard.setValue(datePicker.date, forKey: "DateOfBirth")
        AnalyticsService.reportEvent(with: "DateOfBirth", parameters: ["DateOfBirth" : date])
        self.dismiss(animated: true, completion: nil)
    }
}
