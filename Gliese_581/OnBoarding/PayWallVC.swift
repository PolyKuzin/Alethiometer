//
//  PayWallVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.12.2020.
//

import UIKit

class PayWallVC : BaseVC {
    
    
    let label = UILabel()

    var nextButton = UIButton()
    
    var restoreButton = UIButton()
    
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
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)
        
        feature1.setFeaturesView(on: view, with: UIImage(named: "payWall") ?? #imageLiteral(resourceName: "back"), title: "Personal horoscope".localized(), subtitle: "Daily tips about your life & future".localized())
        feature1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75).isActive = true
        feature2.setFeaturesView(on: view, with: UIImage(named: "payWall-2") ?? #imageLiteral(resourceName: "back"), title: "Focus of the day".localized(), subtitle: "What to pay special attention to".localized())
        feature2.topAnchor.constraint(equalTo: feature1.bottomAnchor, constant: 12).isActive = true
        feature3.setFeaturesView(on: view, with: UIImage(named: "payWall-1") ?? #imageLiteral(resourceName: "back"), title: "Lunar calendar".localized(), subtitle: "Haircuts, beginnings, garden, etc.".localized())
        feature3.topAnchor.constraint(equalTo: feature2.bottomAnchor, constant: 12).isActive = true
        
        restoreButton.setTitleColor(UIColor.grey, for: .normal)
        restoreButton.setTitle("Restore purchases".localized(), for: .normal)
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = FirstVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
