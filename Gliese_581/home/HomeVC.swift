//
//  HomeVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 15.12.2020.
//

import UIKit
import FloatingPanel

var isExpand = false

class HomeVC: BaseVC {
    
    
    @IBOutlet weak var profileButton   : UIButton!
    @IBOutlet weak var zodiacImageView : UIImageView!
    @IBOutlet weak var zodiacNameLabel : UILabel!
    @IBOutlet weak var dateLabel       : UILabel!
    @IBOutlet weak var starsImageView  : UIImageView!
    @IBOutlet weak var expandButton    : UIButton!

    @IBOutlet weak var elementView     : UIView!
    @IBOutlet weak var colorView       : UIView!
    @IBOutlet weak var planetView      : UIView!
    @IBOutlet weak var luckyDaysView   : UIView!
    
    private var menuControllerFPC      : FloatingPanelController!
    private var menuController         : MenuController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expandButton.addTarget(self, action: #selector(self.handleExpand), for: .touchUpInside)
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setupFloatingPanel()
    }
    
    func setUpMenuControllerClosures() {
        menuController.onLockedSelect = {
            [weak self] in
            guard let self = self else { return }
            let alert = UIAlertController(title: "Платное", message: "ОПЛАТИ ПОДПИСКУ, ПАДЛА", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Хорошо", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        menuController.onUNLockedSelect = {
            [weak self] in
            guard let self = self else { return }
            let alert = UIAlertController(title: "Бесплатное", message: "Пока не сделано, сорян", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ок(", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setupFloatingPanel() {
        self.menuController    = MenuController()
        self.menuControllerFPC = FloatingPanelController()
        menuControllerFPC.delegate = self
        menuControllerFPC.surfaceView.backgroundColor = .clear

        menuControllerFPC.layout = MenuFloatingLayout()
        menuControllerFPC.surfaceView.appearance = FloatingPanelController.appereance()

        setUpMenuControllerClosures()

        menuControllerFPC.set(contentViewController: menuController)
        menuControllerFPC.track(scrollView: menuController.tableView)
        menuControllerFPC.addPanel(toParent: self, animated: true)
        menuControllerFPC.surfaceView.grabberHandleSize = .init(width: 0, height: 0)
//        menuControllerFPC
        menuController.makeStandartState()
        menuController.view.setNeedsLayout()
        UIView.animate(withDuration: 0.4) { [weak self] in
            guard let self = self else { return }
            self.menuController.view.layoutIfNeeded()
        }
    }
    
    @objc
    func handleExpand() {
        if isExpand {
            isExpand = false
            self.expandButton.imageView?.transform = CGAffineTransform(rotationAngle: 0)
            UIView.animate(withDuration: 0.2) {
                self.menuControllerFPC.move(to: .half, animated: false)
            }
        } else {
            self.expandButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            isExpand = true
            UIView.animate(withDuration: 0.2) {
                self.menuControllerFPC.move(to: .tip, animated: false)
            }
        }
    }
}
