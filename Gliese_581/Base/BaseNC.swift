//
//  BaseNC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit


class BaseNC: UINavigationController {
    
    override func loadView() {
        super.loadView()
        
    }
    
    public func setTransparent() {
        if #available(iOS 13.0, *) {
            self.navigationBar.standardAppearance.configureWithTransparentBackground()
            self.navigationBar.standardAppearance.backgroundColor = .clear
            
            self.navigationBar.compactAppearance?.configureWithTransparentBackground()
            self.navigationBar.scrollEdgeAppearance?.configureWithTransparentBackground()
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.view.backgroundColor = .background
        self.navigationBar.isTranslucent = false
        let largeTitle = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 34), NSAttributedString.Key.foregroundColor: UIColor.white]
        let defaultTitle = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.white]
            let appereance = UINavigationBarAppearance()
            appereance.backgroundColor = .background
            appereance.shadowColor = .clear
            appereance.setBackIndicatorImage(#imageLiteral(resourceName: "back"), transitionMaskImage: #imageLiteral(resourceName: "back"))

            appereance.largeTitleTextAttributes = largeTitle as [NSAttributedString.Key : Any]
            appereance.titleTextAttributes = defaultTitle
            self.navigationBar.standardAppearance = appereance
            self.navigationBar.compactAppearance = appereance
            self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
        self.navigationBar.barTintColor = .background
        self.navigationBar.tintColor = UIColor.main
        self.navigationItem.backButtonTitle = ""
    }
    
}

