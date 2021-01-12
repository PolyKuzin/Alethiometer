//
//  EditProfileVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 12.01.2021.
//

import UIKit

class EditProfileVC: BaseVC {
    
    var label = UILabel()
    let backButton    = UIButton()
    
    let settings1 = UIView()
    let settings2 = UIView()
    let settings3 = UIView()
    let settings4 = UIView()
    let settings5 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.setTitleLabel(on: self.view)
        if UserDefaults.standard.string(forKey: "UserName") != "" {
            label.text = UserDefaults.standard.string(forKey: "UserName")
        } else {
            label.text = "Your name here".localized()
        }
        let date = UserDefaults.standard.value(forKey: "DateOfBirth") as! Date
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        settings1.setSettingsView(on: self.view, leftText: "Name".localized(), rightText: UserDefaults.standard.string(forKey: "UserName")!)
        settings1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        settings2.setSettingsView(on: self.view, leftText: "Date of birth".localized(), rightText: formatter.string(from: date))
        settings2.topAnchor.constraint(equalTo: settings1.bottomAnchor, constant: 12).isActive = true
        settings3.setSettingsView(on: self.view, leftText: "Gender".localized(), rightText: UserDefaults.standard.string(forKey: "Gender")!)
        settings3.topAnchor.constraint(equalTo: settings2.bottomAnchor, constant: 12).isActive = true
        settings4.setSettingsView(on: self.view, leftText: "Relationships".localized(), rightText: UserDefaults.standard.string(forKey: "Relations")!)
        settings4.topAnchor.constraint(equalTo: settings3.bottomAnchor, constant: 12).isActive = true
        settings5.setSettingsView(on: self.view, leftText: "City".localized(), rightText: UserDefaults.standard.string(forKey: "CityOfBirth")!)
        settings5.topAnchor.constraint(equalTo: settings4.bottomAnchor, constant: 12).isActive = true
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goToSettingsVC), for: .touchUpInside)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(handle1(tap:)))
        tap1.numberOfTapsRequired = 1
        self.settings1.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(handle2(tap:)))
        tap2.numberOfTapsRequired = 1
        self.settings2.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(handle3(tap:)))
        tap3.numberOfTapsRequired = 1
        self.settings3.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(handle4(tap:)))
        tap4.numberOfTapsRequired = 1
        self.settings4.addGestureRecognizer(tap4)

        let tap5 = UITapGestureRecognizer(target: self, action: #selector(handle5(tap:)))
        tap5.numberOfTapsRequired = 1
        self.settings5.addGestureRecognizer(tap5)
    }
    
    @objc
    private func handle1(tap: UITapGestureRecognizer) {
        let vc = NameVC()
        vc.isEditMode = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func handle2(tap: UITapGestureRecognizer) {
        let vc = DateOfBirsthVC()
        vc.isEditMode = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func handle3(tap: UITapGestureRecognizer) {
        let vc = GenderVC()
        vc.isEditMode = true
        if UserDefaults.standard.string(forKey: "Gender") == "Female" {
            vc.femaleButton.layer.borderWidth = 4
            vc.femaleButton.layer.borderColor = UIColor(red: 0, green: 0.914, blue: 0.906, alpha: 1).cgColor
            vc.clearButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
            vc.maleButton.layer.borderWidth = 0
            vc.clearButton.layer.borderWidth = 0
        } else if UserDefaults.standard.string(forKey: "Gender") == "Male" {
            vc.maleButton.layer.borderWidth = 4
            vc.maleButton.layer.borderColor = UIColor(red: 1, green: 0.48, blue: 0, alpha: 1).cgColor
            vc.clearButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
            vc.femaleButton.layer.borderWidth = 0
            vc.clearButton.layer.borderWidth = 0
        } else if UserDefaults.standard.string(forKey: "Gender") == "LGBT" {
            vc.clearButton.layer.borderWidth = 4
            vc.clearButton.layer.borderColor = UIColor(red: 0.829, green: 0.453, blue: 0.589, alpha: 1).cgColor
            vc.clearButton.setTitleColor(UIColor(red: 0.829, green: 0.453, blue: 0.589, alpha: 1), for: .normal)
            vc.maleButton.layer.borderWidth = 0
            vc.femaleButton.layer.borderWidth = 0
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func handle4(tap: UITapGestureRecognizer) {
        let vc = RelationShipsVC()
        vc.isEditMode = true
        if UserDefaults.standard.string(forKey: "Relations") == "Alone" {
            vc.aloneButton.layer.borderWidth = 4
            vc.aloneButton.layer.borderColor = UIColor(red: 0.545, green: 0.471, blue: 0.792, alpha: 1).cgColor
            vc.relateButton.layer.borderWidth = 0
        } else if UserDefaults.standard.string(forKey: "Relations") == "In Relationship" {
            vc.relateButton.layer.borderWidth = 4
            vc.relateButton.layer.borderColor = UIColor(red: 0.933, green: 0.29, blue: 0.455, alpha: 1).cgColor
            vc.aloneButton.layer.borderWidth = 0
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func handle5(tap: UITapGestureRecognizer) {
        let vc = CityOfBirsthVC()
        vc.isEditMode = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func goToSettingsVC() {
        navigationController?.popViewController(animated: true)
    }
}
