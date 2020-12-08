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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.setTitleLabel(on: view)
        label.text = "Relationships"
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
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func setChoiseMale() {
        aloneButton.layer.borderWidth = 4
        aloneButton.layer.borderColor = UIColor(red: 0.545, green: 0.471, blue: 0.792, alpha: 1).cgColor
        relateButton.layer.borderWidth = 0
    }
    
    @objc
    private func setChoiseFemale() {
        relateButton.layer.borderWidth = 4
        relateButton.layer.borderColor = UIColor(red: 0.933, green: 0.29, blue: 0.455, alpha: 1).cgColor
        aloneButton.layer.borderWidth = 0
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = HandVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
