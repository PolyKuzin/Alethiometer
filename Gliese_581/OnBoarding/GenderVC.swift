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

    override func viewDidLoad() {
        super.viewDidLoad()

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

    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func setChoiseMale() {
        maleButton.layer.borderWidth = 4
        maleButton.layer.borderColor = UIColor(red: 1, green: 0.48, blue: 0, alpha: 1).cgColor
        femaleButton.layer.borderWidth = 0
    }
    
    @objc
    private func setChoiseFemale() {
        femaleButton.layer.borderWidth = 4
        femaleButton.layer.borderColor = UIColor(red: 0, green: 0.914, blue: 0.906, alpha: 1).cgColor
        maleButton.layer.borderWidth = 0
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = NameVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
