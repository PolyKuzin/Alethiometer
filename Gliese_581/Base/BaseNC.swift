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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navigationController = navigationController else { return }
//        navigationController.navigationBar.barTintColor  = .clear
//        navigationController.navigationBar.isTranslucent = true
//        navigationController.navigationBar.shadowImage   = UIImage()
//        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.tintColor        = UIColor.clear
////        self.navigationBar.barTintColor     = .clear
//        self.navigationItem.backButtonTitle = ""
        navigationController.navigationBar.isHidden = true
    }
}

