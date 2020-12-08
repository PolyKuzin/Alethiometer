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
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.barTintColor  = .clear
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.shadowImage   = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .background
        self.navigationBar.tintColor = UIColor.clear
        self.navigationItem.backButtonTitle = ""
    }
}

