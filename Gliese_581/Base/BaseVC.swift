//
//  BaseViewController.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.11.2020.
//

import UIKit
import FloatingPanel

class BaseVC : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        view.backgroundColor = UIColor.background
    }
}

extension BaseVC : FloatingPanelControllerDelegate {
    
}
