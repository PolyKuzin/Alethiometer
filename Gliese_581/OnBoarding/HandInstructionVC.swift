//
//  HandInstructionVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 16.01.2021.
//

import UIKit

class HandInstructionVC: BaseVC {

    var label = UILabel()
    var explanationLabel1 = UILabel()
    var explanationLabel2 = UILabel()
    var handImage = UIImageView()
    var explanationLabel3 = UILabel()
    var nextButton = UIButton()
    var skipButton = UIButton()
    var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Your palm"
        label.setTitleLabel(on: self.view)
        backButton.setBackButton(on: self.view)
        nextButton.setNextButton(on: self.view)
        nextButton.setTitle("I‘m ready", for: .normal)
        nextButton.addTarget(self, action: #selector(goToHandVC), for: .touchUpInside)
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
        
        explanationLabel1.setupexplanationLabel(on: self.view)
        NSLayoutConstraint.activate([
            explanationLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            explanationLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            explanationLabel1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        ])
        explanationLabel1.text = "For a more accurate prediction, we need to recognize your life lines. For this we will scan your palm and analyze it with AI.".localized()
        
        explanationLabel2.setupexplanationLabel(on: self.view)
        NSLayoutConstraint.activate([
            explanationLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            explanationLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            explanationLabel2.topAnchor.constraint(equalTo: explanationLabel1.bottomAnchor, constant: 16)
        ])
        explanationLabel2.text = "It's like magic!".localized()
        
        handImage.image = UIImage(named: "Hand")
        view.addSubview(handImage)
        handImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            handImage.widthAnchor.constraint(equalToConstant: 250),
            handImage.heightAnchor.constraint(equalToConstant: 250),
            handImage.topAnchor.constraint(equalTo: explanationLabel2.bottomAnchor, constant: 20),
            handImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        explanationLabel3.setupexplanationLabel(on: self.view)
        NSLayoutConstraint.activate([
            explanationLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            explanationLabel3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            explanationLabel3.topAnchor.constraint(equalTo: handImage.bottomAnchor, constant: 16)
        ])
        explanationLabel3.text = "Just take photo of your hand".localized()
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = PayWallVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func goToHandVC() {
        let vc = HandVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
