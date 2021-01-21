//
//  MainPayWallVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 13.01.2021.
//

import UIKit

class MainPayWallVC: BaseVC {
    let notificationCenteer = NotificationCenter.default
    var iapManager = IAPManager.shared
    var label = UILabel()
    var backButton = UIButton()
    
    let feature1      = UIView()
    let feature2      = UIView()
    let feature3      = UIView()
    
    let cancelLabel = UILabel()
    var restoreButton = UIButton()
    var purchaiseButton = UIButton()
    var termsOffUse = UIButton()
    var privacyPolicy = UIButton()
    
    var yearlyView = UIView()
    var monthView  = UIView()
    var yearlyLabel = UILabel()
    var monthLabel = UILabel()
    
    var year = UILabel()
    var month = UILabel()
    var yearPrice = UILabel()
    var monthPrice = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.frame  = CGRect(x: 0, y: 0, width: 13, height: 20)
        backButton.setImage(UIImage(named: "Cross"), for: .normal)
        notificationCenteer.addObserver(self, selector: #selector(selfDismiss), name: NSNotification.Name(IAPProducts.autoRenew.rawValue), object: nil)
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 23),
            backButton.heightAnchor.constraint(equalToConstant: 23),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        backButton.addTarget(self, action: #selector(selfDismiss), for: .touchUpInside)
        label.setTitleLabel(on: self.view)
        label.text = "Become a PRO-Horoscoper with Premium".localized()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.numberOfLines = 0
        
        feature1.setFeaturesView(on: view, with: UIImage(named: "payWall") ?? #imageLiteral(resourceName: "back"), title: "Personal horoscope designed specifically for you".localized(),
                                 subtitle: "".localized(), isClickable: false)
        feature1.backgroundColor = .clear
        switch UIDevice.modelName {
        case "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6s", "iPhone 7", "iPhone SE", "iPhone SE (2nd generation)", "iPhone 8", "iPod touch (6th generation)", "iPod touch (7th generation)", "Simulator iPhone 5c", "Simulator iPhone 5s", "Simulator iPhone 6", "Simulator iPhone 6s", "Simulator iPhone 7", "Simulator iPhone SE", "Simulator iPhone 8", "Simulator iPod touch (6th generation)", "Simulator iPod touch (7th generation)", "Simulator iPhone SE (2nd generation)":
            feature1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        default:
            feature1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        }
        feature2.setFeaturesView(on: view, with: UIImage(named: "Ball") ?? #imageLiteral(resourceName: "back"), title: "Predictions for the tommorow, week and year".localized(),
                                 subtitle: "".localized(), isClickable: false)
        feature2.backgroundColor = .clear
        feature2.topAnchor.constraint(equalTo: feature1.bottomAnchor, constant: -11).isActive = true
        feature3.setFeaturesView(on: view, with: UIImage(named: "payWall-1") ?? #imageLiteral(resourceName: "back"), title: "Lunar calendar of your sign".localized(),
                                 subtitle: "".localized(), isClickable: false)
        feature3.backgroundColor = .clear
        feature3.topAnchor.constraint(equalTo: feature2.bottomAnchor, constant: -11).isActive = true
        
        purchaiseButton.setNextButton(on: self.view)
        purchaiseButton.layer.sublayers?.remove(at: 0)
        purchaiseButton.setTitle("Continue".localized(), for: .normal)
        purchaiseButton.backgroundColor = UIColor(red: 1, green: 0.871, blue: 0.624, alpha: 1)
        
        self.view.addSubview(cancelLabel)
        cancelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cancelLabel.bottomAnchor.constraint(equalTo: purchaiseButton.topAnchor, constant: -8),
            cancelLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        cancelLabel.textColor = UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1)
        cancelLabel.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        cancelLabel.text = "Cancel anytime"
        cancelLabel.textAlignment = .center
        
        self.view.addSubview(restoreButton)
        restoreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restoreButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            restoreButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
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
        privacyPolicy.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        privacyPolicy.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        privacyPolicy.addTarget(self, action: #selector(openPrivacy), for: .touchUpInside)
        
        view.addSubview(yearlyView)
        yearlyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(monthView)
        monthView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            yearlyView.topAnchor.constraint(equalTo: feature3.bottomAnchor, constant: 15),
//            monthView.topAnchor.constraint(equalTo: feature3.bottomAnchor, constant: 15),
            yearlyView.heightAnchor.constraint(equalToConstant: 150),
            monthView.heightAnchor.constraint(equalToConstant: 150),

            yearlyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            monthView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            yearlyView.bottomAnchor.constraint(equalTo: cancelLabel.topAnchor, constant: -8),
            monthView.bottomAnchor.constraint(equalTo: cancelLabel.topAnchor, constant: -8),
            yearlyView.widthAnchor.constraint(equalTo: monthView.widthAnchor),
            yearlyView.trailingAnchor.constraint(equalTo: monthView.leadingAnchor, constant: -15),
        ])
        yearlyView.backgroundColor = UIColor(red: 0.239, green: 0.235, blue: 0.267, alpha: 1)
        monthView.backgroundColor = UIColor(red: 0.239, green: 0.235, blue: 0.267, alpha: 1)
        yearlyView.layer.cornerRadius = 27
        monthView.layer.cornerRadius = 27
        monthView.layer.borderWidth = 4
        monthView.layer.borderColor = UIColor(red: 1, green: 0.871, blue: 0.624, alpha: 1).cgColor
        
        view.addSubview(monthLabel)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthLabel.heightAnchor.constraint(equalToConstant: 36),
            monthLabel.centerXAnchor.constraint(equalTo: monthView.centerXAnchor),
            monthLabel.bottomAnchor.constraint(equalTo: monthView.topAnchor, constant: 18),
            monthLabel.leadingAnchor.constraint(equalTo: monthView.leadingAnchor, constant: 25)
        ])
        monthLabel.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        monthLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        monthLabel.backgroundColor = .main
        monthLabel.text = "Best Price"
        monthLabel.textAlignment = .center
        monthLabel.roundCorners(.all, radius: 9)
        
        view.addSubview(yearlyLabel)
        yearlyLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearlyLabel.heightAnchor.constraint(equalToConstant: 36),
            yearlyLabel.centerXAnchor.constraint(equalTo: yearlyView.centerXAnchor),
            yearlyLabel.bottomAnchor.constraint(equalTo: yearlyView.topAnchor, constant: 18),
            yearlyLabel.leadingAnchor.constraint(equalTo: yearlyView.leadingAnchor, constant: 25)
        ])
        yearlyLabel.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        yearlyLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        yearlyLabel.backgroundColor = .main
        yearlyLabel.text = "Most Popular"
        yearlyLabel.textAlignment = .center
        yearlyLabel.roundCorners(.all, radius: 9)
        yearlyLabel.isHidden = true
        
        yearlyView.addSubview(year)
        year.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            year.centerXAnchor.constraint(equalTo: yearlyView.centerXAnchor),
            year.topAnchor.constraint(equalTo: yearlyView.topAnchor, constant: 48)
        ])
        year.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        year.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        year.text = "Yearly"
        
        monthView.addSubview(month)
        month.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            month.centerXAnchor.constraint(equalTo: monthView.centerXAnchor),
            month.topAnchor.constraint(equalTo: monthView.topAnchor, constant: 48)
        ])
        month.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        month.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        month.text = "Weekly"
        
        yearlyView.addSubview(yearPrice)
        yearPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            yearPrice.centerXAnchor.constraint(equalTo: year.centerXAnchor),
            yearPrice.topAnchor.constraint(equalTo: year.bottomAnchor, constant: 25)
        ])
        yearPrice.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        yearPrice.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        yearPrice.text = "$1 per year"
        
        monthView.addSubview(monthPrice)
        monthPrice.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            monthPrice.centerXAnchor.constraint(equalTo: month.centerXAnchor),
            monthPrice.topAnchor.constraint(equalTo: month.bottomAnchor, constant: 25)
        ])
        monthPrice.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        monthPrice.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        monthPrice.text = "$1 per week "
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(chooseMounth))
        tap1.numberOfTapsRequired = 1
        monthView.addGestureRecognizer(tap1)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(chooseYear))
        tap2.numberOfTapsRequired = 1
        yearlyView.addGestureRecognizer(tap2)
        
        UserDefaults.standard.setValue(true, forKey: "Registered")
    }
    
    @objc
    private func chooseMounth() {
        monthLabel.isHidden = false
        yearlyLabel.isHidden = true
        monthView.layer.borderWidth = 4
        monthView.layer.borderColor = UIColor(red: 1, green: 0.871, blue: 0.624, alpha: 1).cgColor
        yearlyView.layer.borderWidth = 0
    }
    
    @objc
    private func chooseYear() {
        monthLabel.isHidden = true
        yearlyLabel.isHidden = false
        yearlyView.layer.borderWidth = 4
        yearlyView.layer.borderColor = UIColor(red: 1, green: 0.871, blue: 0.624, alpha: 1).cgColor
        monthView.layer.borderWidth = 0
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
    @objc
    private func selfDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func togglePayment() { // TODO: - Вставить новую покупку
        if self.yearlyView.layer.borderWidth > 0 {
            let identifire = iapManager.products.filter({$0.productIdentifier == IAPProducts.autoRenew.rawValue}).first?.productIdentifier
            iapManager.purchase(productWith: identifire!)
        } else {
            let identifire = iapManager.products.filter({$0.productIdentifier == IAPProducts.autoRenew.rawValue}).first?.productIdentifier
            iapManager.purchase(productWith: identifire!)
        }
    }
}

extension UILabel {
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }

    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }

    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: rect.inset(by: insets))
        } else {
            self.drawText(in: rect)
        }
    }

    override open var intrinsicContentSize: CGSize {
        guard let text = self.text else { return super.intrinsicContentSize }

        var contentSize = super.intrinsicContentSize
        var textWidth: CGFloat = frame.size.width
        var insetsHeight: CGFloat = 0.0
        var insetsWidth: CGFloat = 0.0

        if let insets = padding {
            insetsWidth += insets.left + insets.right
            insetsHeight += insets.top + insets.bottom
            textWidth -= insetsWidth
        }

        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: self.font], context: nil)

        contentSize.height = ceil(newSize.size.height) + insetsHeight
        contentSize.width = ceil(newSize.size.width) + insetsWidth

        return contentSize
    }
}
