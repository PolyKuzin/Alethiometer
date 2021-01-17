//
//  GenderVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class GenderVC: BaseVC {

    let label = UILabel()
    var nextButton = UIButton()
    var maleButton = UIButton()
    var femaleButton = UIButton()
    var maleLabel = UILabel()
    var femaleLabel = UILabel()
    var clearButton = UIButton()
    var backButton = UIButton()
    var skipButton = UIButton()
    
    var isEditMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.alpha = 0.3
        nextButton.isEnabled = false
        label.setTitleLabel(on: view)
        label.text = "Your gender"
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        maleButton.setMaleButton(on: view)
        femaleButton.setFemaleButton(on: view)
        NSLayoutConstraint.activate([
            maleButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75),
            femaleButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75),
        ])
        
        maleButton.addTarget(self, action: #selector(setChoiseMale), for: .touchUpInside)
        femaleButton.addTarget(self, action: #selector(setChoiseFemale), for: .touchUpInside)
        
        maleLabel.text = "Male"
        femaleLabel.text = "Female"
        maleButton.setImage(UIImage(named: "MaleGender"), for: .normal)
        femaleButton.setImage(UIImage(named: "FemaleGender"), for: .normal)
        
        maleLabel.setGenderLabel()
        femaleLabel.setGenderLabel()
        view.addSubview(maleLabel)
        view.addSubview(femaleLabel)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maleLabel.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: 8),
            femaleLabel.topAnchor.constraint(equalTo: femaleButton.bottomAnchor, constant: 8),
            maleLabel.centerXAnchor.constraint(equalTo: maleButton.centerXAnchor),
            femaleLabel.centerXAnchor.constraint(equalTo: femaleButton.centerXAnchor),

        ])
        clearButton.setClearButton(on: self.view)
        clearButton.addTarget(self, action: #selector(setChoiseLQBT), for: .touchUpInside)
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: femaleLabel.bottomAnchor, constant: 40),
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearButton.widthAnchor.constraint(equalToConstant: 200),
            clearButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        clearButton.setTitle("LGBTQ+", for: .normal)
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
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
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func setChoiseMale() {
        maleButton.layer.borderWidth = 4
        maleButton.layer.borderColor = UIColor(red: 1, green: 0.48, blue: 0, alpha: 1).cgColor
        clearButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        femaleButton.layer.borderWidth = 0
        clearButton.layer.borderWidth = 0
        nextButton.alpha = 1
        nextButton.isEnabled = true
    }
    
    @objc
    private func setChoiseFemale() {
        femaleButton.layer.borderWidth = 4
        femaleButton.layer.borderColor = UIColor(red: 0, green: 0.914, blue: 0.906, alpha: 1).cgColor
        clearButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        maleButton.layer.borderWidth = 0
        clearButton.layer.borderWidth = 0
        nextButton.alpha = 1
        nextButton.isEnabled = true
    }
    
    @objc
    private func setChoiseLQBT() {
        clearButton.layer.borderWidth = 4
        clearButton.layer.borderColor = UIColor(red: 0.829, green: 0.453, blue: 0.589, alpha: 1).cgColor
        clearButton.setTitleColor(UIColor(red: 0.829, green: 0.453, blue: 0.589, alpha: 1), for: .normal)
        maleButton.layer.borderWidth = 0
        femaleButton.layer.borderWidth = 0
        nextButton.alpha = 1
        nextButton.isEnabled = true
    }
    
    @objc
    private func goToDateOfBirthVC() {
        if isEditMode {
            if femaleButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("Female", forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender-Changed", parameters: ["Gender" : "Female"])
            } else if maleButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("Male",   forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender-Changed", parameters: ["Gender" : "Male"])
            } else if clearButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("LGBT", forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender-Changed", parameters: ["Gender" : "LQBT"])
            } else {
                UserDefaults.standard.setValue("", forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender-Changed", parameters: ["Gender" : "Не указал пол"])
            }
            let alert = UIAlertController(title: "Your gender info has changed!", message: "It will be changed on main screen)".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks)", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)

        } else {
            let vc = NameVC()
            guard let navigationController = navigationController else { return }
            navigationController.pushViewController(vc, animated: true)
            if femaleButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("Female", forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender", parameters: ["Gender" : "Female"])
            } else if maleButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("Male",   forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender", parameters: ["Gender" : "Male"])
            } else if clearButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("LGBT", forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender", parameters: ["Gender" : "LQBT"])
            } else {
                UserDefaults.standard.setValue("", forKey: "Gender")
                AnalyticsService.reportEvent(with: "Gender", parameters: ["Gender" : "Не указал пол"])
            }

        }
        self.dismiss(animated: true, completion: nil)
    }
}
