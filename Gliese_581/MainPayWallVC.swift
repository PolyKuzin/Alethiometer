//
//  MainPayWallVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 13.01.2021.
//

import UIKit

class MainPayWallVC: BaseVC {
    
    var iapManager = IAPManager.shared
    var label = UILabel()
    var backButton = UIButton()
    var restoreButton = UIButton()
    var purchaiseButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setBackButton(on: self.view)
        label.setTitleLabel(on: self.view)
        purchaiseButton.setNextButton(on: self.view)
        purchaiseButton.setTitle("Purchase".localized(), for: .normal)

        self.view.addSubview(restoreButton)
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restoreButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            restoreButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            restoreButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        restoreButton.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        restoreButton.setTitle("Restore purchases".localized(), for: .normal)
        
        backButton.addTarget(self, action: #selector(selfDismiss), for: .touchUpInside)
        purchaiseButton.addTarget(self, action: #selector(togglePayment), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(restorePurchaice), for: .touchUpInside)
    }
    
    @objc
    private func selfDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func togglePayment() {
        let identifire = iapManager.products.filter({$0.productIdentifier == IAPProducts.autoRenew.rawValue}).first?.productIdentifier
        iapManager.purchase(productWith: identifire!)
    }
    
    @objc
    private func restorePurchaice() {
        iapManager.restoreCompletedTransactions()
    }
}
