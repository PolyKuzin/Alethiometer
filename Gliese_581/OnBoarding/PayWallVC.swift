//
//  PayWallVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.12.2020.
//

import UIKit

class PayWallVC : BaseVC {
    
    
    let label = UILabel()

    var supplyLabel = UILabel()
    
    var nextButton = UIButton()
    
    var restoreButton = UIButton()
    
    var notNowButton = UIButton()
    
    let feature1 = UIView()
    let feature2 = UIView()
    let feature3 = UIView()
    let feature4 = UIView()
    let feature5 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.setTitleLabel(on: view)
        label.text = "Became PRO-horoscoper"
        nextButton.setNextButton(on: view)
        nextButton.setTitle("Try FREE & Subscribe", for: .normal)
        
        notNowButton.addTarget(self, action: #selector(goToHomeVC), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(togglePayment), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(restorePurchaice), for: .touchUpInside)
        
        feature1.setFeaturesView(on: view, with: UIImage(named: "payWall") ?? #imageLiteral(resourceName: "back"), title: "Personal horoscope".localized(), subtitle: "Daily tips about your life & future".localized())
        feature1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75).isActive = true
        feature2.setFeaturesView(on: view, with: UIImage(named: "payWall-2") ?? #imageLiteral(resourceName: "back"), title: "Focus of the day".localized(), subtitle: "What to pay special attention to".localized())
        feature2.topAnchor.constraint(equalTo: feature1.bottomAnchor, constant: 12).isActive = true
        feature3.setFeaturesView(on: view, with: UIImage(named: "payWall-1") ?? #imageLiteral(resourceName: "back"), title: "Lunar calendar".localized(), subtitle: "Haircuts, beginnings, garden, etc.".localized())
        feature3.topAnchor.constraint(equalTo: feature2.bottomAnchor, constant: 12).isActive = true
        
        self.view.addSubview(notNowButton)
        notNowButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notNowButton.heightAnchor.constraint(equalToConstant: 19),
            notNowButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            notNowButton.bottomAnchor.constraint(equalTo: self.feature1.topAnchor, constant: -10)
        ])
        notNowButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        notNowButton.setTitle("Not now".localized(), for: .normal)
        
        self.view.addSubview(supplyLabel)
        supplyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            supplyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            supplyLabel.heightAnchor.constraint(equalToConstant: 19),
            supplyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5),
            supplyLabel.bottomAnchor.constraint(equalTo: self.nextButton.topAnchor, constant: -10)
        ])
        label.numberOfLines = 2
        supplyLabel.textAlignment = .center
        supplyLabel.textColor = UIColor(red: 0.613, green: 0.613, blue: 0.613, alpha: 1)
        supplyLabel.text = "Try 7 days free, then $19/year. Cancel anytime."
        supplyLabel.numberOfLines = 2
        
        self.view.addSubview(restoreButton)
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restoreButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            restoreButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            restoreButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        restoreButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        restoreButton.setTitle("Restore purchases".localized(), for: .normal)
        
        UserDefaults.standard.setValue(true, forKey: "Registered")
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func togglePayment() {
        
    }
    
    @objc
    private func restorePurchaice() {
        
    }
    
    @objc
    private func goToHomeVC() {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
