//
//  PayWallVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.12.2020.
//

import UIKit
import StoreKit
import SafariServices

class PayWallVC : BaseVC {
    
    let feature1      = UIView()
    let feature2      = UIView()
    let feature3      = UIView()
    
    let label         = UILabel()
    var supplyLabel   = UILabel()
    var nextButton    = UIButton()
    var notNowButton  = UIButton()
    var restoreButton = UIButton()
    var privacyPolicy = UIButton()
    var termsOffUse   = UIButton()
    
    let iapManager = IAPManager.shared
    let notificationCenteer = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenteer.addObserver(self, selector: #selector(goToHomeVC), name: NSNotification.Name(IAPProducts.autoRenew.rawValue), object: nil)
        label.setTitleLabel(on: view)
        label.text = "Become a PRO-Horoscoper"
        nextButton.setNextButton(on: view)
        nextButton.setTitle("Try FREE & Subscribe", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        notNowButton.addTarget(self, action: #selector(goToHomeVC), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(togglePayment), for: .touchUpInside)
        
        feature1.setFeaturesView(on: view, with: UIImage(named: "payWall") ?? #imageLiteral(resourceName: "back"), title: "Personal horoscope".localized(),
                                 subtitle: "Daily tips about your life & future".localized(), isClickable: false)
        feature1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75).isActive = true
        feature2.setFeaturesView(on: view, with: UIImage(named: "payWall-2") ?? #imageLiteral(resourceName: "back"), title: "Focus of the day".localized(),
                                 subtitle: "What to pay special attention to".localized(), isClickable: false)
        feature2.topAnchor.constraint(equalTo: feature1.bottomAnchor, constant: 12).isActive = true
        feature3.setFeaturesView(on: view, with: UIImage(named: "payWall-1") ?? #imageLiteral(resourceName: "back"), title: "Lunar calendar".localized(),
                                 subtitle: "Haircuts, beginnings, garden, etc.".localized(), isClickable: false)
        feature3.topAnchor.constraint(equalTo: feature2.bottomAnchor, constant: 12).isActive = true
        
        self.view.addSubview(notNowButton)
        notNowButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notNowButton.heightAnchor.constraint(equalToConstant: 19),
            notNowButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            notNowButton.bottomAnchor.constraint(equalTo: self.feature1.topAnchor, constant: -15)
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
        supplyLabel.text = "Try 7 days free, then $7,99 Cancel anytime."
        supplyLabel.numberOfLines = 2
        supplyLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        self.view.addSubview(restoreButton)
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restoreButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            restoreButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
//            restoreButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        restoreButton.setTitleColor(UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), for: .normal)
        restoreButton.setTitle("Restore purchases".localized(), for: .normal)
        restoreButton.titleLabel?.numberOfLines = 0
        restoreButton.titleLabel?.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        restoreButton.addTarget(self, action: #selector(restorePurchaice), for: .touchUpInside)

        self.view.addSubview(termsOffUse)
        termsOffUse.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            termsOffUse.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            termsOffUse.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
//            termsOffUse.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        termsOffUse.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        termsOffUse.setTitle("Terms of use".localized(), for: .normal)
        termsOffUse.titleLabel?.numberOfLines = 0
        termsOffUse.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        termsOffUse.addTarget(self, action: #selector(openTerms), for: .touchUpInside)

        self.view.addSubview(privacyPolicy)
        privacyPolicy.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            privacyPolicy.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            privacyPolicy.leadingAnchor.constraint(equalTo: self.restoreButton.trailingAnchor, constant: -5),
            privacyPolicy.trailingAnchor.constraint(equalTo: self.termsOffUse.leadingAnchor, constant: -5),
        ])
        privacyPolicy.setTitleColor(UIColor(red: 0.446, green: 0.446, blue: 0.446, alpha: 1), for: .normal)
        privacyPolicy.setTitle("Privacy policy".localized(), for: .normal)
        privacyPolicy.titleLabel?.numberOfLines = 0
        privacyPolicy.titleLabel?.textAlignment = .right
        privacyPolicy.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        privacyPolicy.addTarget(self, action: #selector(openPrivacy), for: .touchUpInside)
        
        UserDefaults.standard.setValue(true, forKey: "Registered")
    }
    
    @objc
    private func restorePurchaice() {
        iapManager.restoreCompletedTransactions()
    }
    
    @objc
    private func openPrivacy() {
        self.openWeb(link: "")  // TODO: - Вставить ссылку на политику
    }
    
    @objc
    private func openTerms() {
        self.openWeb(link: "")  // TODO: - Вставить ссылку на политику
    }
    
    deinit {
        notificationCenteer.removeObserver(self)
    }
    
    private func priceStringFor(_ product: SKProduct) -> String {
        let numberFormattor = NumberFormatter()
        numberFormattor.numberStyle = .currency
        numberFormattor.locale = product.priceLocale
        
        return numberFormattor.string(from: product.price)!
    }
    
    override func viewDidDisappear(_ animated: Bool)    {
        super.viewWillDisappear(animated)
        guard let navigationController = navigationController else { return }
        navigationController.viewControllers.removeAll(where: { self === $0 })
    }
    
    @objc
    private func togglePayment() {
        let identifire = iapManager.products.filter({$0.productIdentifier == IAPProducts.autoRenew.rawValue}).first?.productIdentifier
        iapManager.purchase(productWith: identifire!)
    }
    
    @objc
    private func goToHomeVC() {
        let vc = HomeVC(nibName: "HomeVC", bundle: nil)
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
