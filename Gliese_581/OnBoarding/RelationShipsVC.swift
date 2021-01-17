//
//  RelationShipsVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit

class RelationShipsVC: BaseVC {

    let label = UILabel()
    var nextButton = UIButton()
    var aloneButton = UIButton()
    var relateButton = UIButton()
    var aloneLabel = UILabel()
    var relateLabel = UILabel()
    var backButton = UIButton()
    var skipButton = UIButton()

    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.alpha = 0.3
        nextButton.isEnabled = false
        
        label.setTitleLabel(on: view)
        label.text = "Your relationships"
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)

        aloneButton.setMaleButton(on: view)
        relateButton.setFemaleButton(on: view)
        NSLayoutConstraint.activate([
            aloneButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75),
            relateButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75),
        ])
        
        aloneLabel.text = "Alone"
        relateLabel.text = "In the relations"
        
        aloneButton.setImage(UIImage(named: "Alone"), for: .normal)
        relateButton.setImage(UIImage(named: "Relate"), for: .normal)
        
        aloneButton.addTarget(self, action: #selector(setChoiseMale), for: .touchUpInside)
        relateButton.addTarget(self, action: #selector(setChoiseFemale), for: .touchUpInside)
        
        aloneLabel.setGenderLabel()
        relateLabel.setGenderLabel()
        view.addSubview(aloneLabel)
        view.addSubview(relateLabel)
        aloneLabel.translatesAutoresizingMaskIntoConstraints = false
        relateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aloneLabel.topAnchor.constraint(equalTo: aloneButton.bottomAnchor, constant: 8),
            relateLabel.topAnchor.constraint(equalTo: relateButton.bottomAnchor, constant: 8),
            aloneLabel.centerXAnchor.constraint(equalTo: aloneButton.centerXAnchor),
            relateLabel.centerXAnchor.constraint(equalTo: relateButton.centerXAnchor),
        ])
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
        } else {
            nextButton.setTitle("Save", for: .normal)
        }
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func setChoiseMale() {
        nextButton.alpha = 1
        nextButton.isEnabled = true
        aloneButton.layer.borderWidth = 4
        aloneButton.layer.borderColor = UIColor(red: 0.545, green: 0.471, blue: 0.792, alpha: 1).cgColor
        relateButton.layer.borderWidth = 0
    }
    
    @objc
    private func setChoiseFemale() {
        nextButton.alpha = 1
        nextButton.isEnabled = true
        relateButton.layer.borderWidth = 4
        relateButton.layer.borderColor = UIColor(red: 0.933, green: 0.29, blue: 0.455, alpha: 1).cgColor
        aloneButton.layer.borderWidth = 0
    }
    
    @objc
    private func goToDateOfBirthVC() {
        if isEditMode {
            if relateButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("In Relationship", forKey: "Relations")
                AnalyticsService.reportEvent(with: "Relations", parameters: ["Relations-Changed" : "In Relationship"])
            } else if aloneButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("Alone",   forKey: "Relations")
                AnalyticsService.reportEvent(with: "Relations", parameters: ["Relations-Changed" : "Anone"])
            } else {
                UserDefaults.standard.setValue("",   forKey: "Relations")
                AnalyticsService.reportEvent(with: "Relations", parameters: ["Relations-Changed" : "Не указал статус отношений"])
            }
            let alert = UIAlertController(title: "Your relationship status has changed!", message: "It will be changed on main screen)".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Thanks)", style: .default, handler: { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        } else {
            let vc = HandInstructionVC()
            guard let navigationController = navigationController else { return }
            navigationController.pushViewController(vc, animated: true)
            if relateButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("In Relationship", forKey: "Relations")
                AnalyticsService.reportEvent(with: "Relations", parameters: ["Relations" : "In Relationship"])
            } else if aloneButton.layer.borderWidth != 0 {
                UserDefaults.standard.setValue("Alone",   forKey: "Relations")
                AnalyticsService.reportEvent(with: "Relations", parameters: ["Relations" : "Anone"])
            } else {
                UserDefaults.standard.setValue("",   forKey: "Relations")
                AnalyticsService.reportEvent(with: "Relations", parameters: ["Relations" : "Не указал статус отношений"])
            }
        }
    }
}
