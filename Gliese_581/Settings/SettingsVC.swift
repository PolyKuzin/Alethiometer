//
//  SettingsVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 12.01.2021.
//

import UIKit

class SettingsVC : BaseVC {
    
    let feature1      = UIView()
    let feature2      = UIView()
    let feature3      = UIView()
    let feature4      = UIView()
    let feature5      = UIView()
    let label         = UILabel()
    let backButton    = UIButton()
    
    var nextButton  = UIButton()
    
    let iapManager = IAPManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.setTitleLabel(on: view)
        label.text = "Settings"
        backButton.setBackButton(on: self.view)
        backButton.addTarget(self, action: #selector(goToHomeVC), for: .touchUpInside)
        
        feature1.setFeaturesView(on: view, with: UIImage(named: "MainProfile") ?? #imageLiteral(resourceName: "back"), title: "Profile settings".localized(),
                                 subtitle: "Сhange your info".localized(), isClickable: true)
        feature1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 75).isActive = true
        feature2.setFeaturesView(on: view, with: UIImage(named: "Mail") ?? #imageLiteral(resourceName: "back"), title: "Contact developer".localized(),
                                 subtitle: "If uou found some buges, report us".localized(), isClickable: true)
        feature2.topAnchor.constraint(equalTo: feature1.bottomAnchor, constant: 12).isActive = true
        feature3.setFeaturesView(on: view, with: UIImage(named: "Share") ?? #imageLiteral(resourceName: "back"), title: "Share the app".localized(),
                                 subtitle: "Haircuts, beginnings, garden, etc.".localized(), isClickable: true)
        feature3.topAnchor.constraint(equalTo: feature2.bottomAnchor, constant: 12).isActive = true
        
        nextButton.setNextButton(on: view)
        nextButton.setTitle("Try FREE & Subscribe", for: .normal)
        nextButton.titleLabel?.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        nextButton.addTarget(self, action: #selector(togglePayment), for: .touchUpInside)
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(handle1(tap:)))
        tap1.numberOfTapsRequired = 1
        self.feature1.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(handle2(tap:)))
        tap2.numberOfTapsRequired = 1
        self.feature2.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(handle3(tap:)))
        tap3.numberOfTapsRequired = 1
        self.feature3.addGestureRecognizer(tap3)
    }
    
    @objc
    private func handle1(tap: UITapGestureRecognizer) {
        let vc = EditProfileVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func handle2(tap: UITapGestureRecognizer) {
        self.openMailController(MailMessage(to: "teencult.official@gmail.com", title: "[Обратная связь] Укажите тему", body: "Напишите ваше сообщение"))
    }
    
    @objc
    private func handle3(tap: UITapGestureRecognizer) {
        let firstActivityItem = "Share Alethiometer"
        let secondActivityItem : NSURL = NSURL(string: "http://your-url.com/")! //TODO:
        
            // If you want to use an image
        let image : UIImage = UIImage(named: "Relate")!
        let activityViewController : UIActivityViewController = UIActivityViewController(
        activityItems: [firstActivityItem, secondActivityItem, image], applicationActivities: nil)
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
        activityViewController.activityItemsConfiguration = [
            UIActivity.ActivityType.message
        ] as? UIActivityItemsConfigurationReading
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.postToFacebook
        ]
        
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)
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
    
    @objc
    private func goToHomeVC() {
        navigationController?.popViewController(animated: true)
    }
}
