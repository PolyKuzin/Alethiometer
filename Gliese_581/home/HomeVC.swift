//
//  HomeVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 15.12.2020.
//

import UIKit
import FloatingPanel

var isExpand = false
var currentFocus = (0, 0)

class HomeVC: BaseVC {
    
    public var segmentControl: ScrollableSegmentControl = {
        let control        = ScrollableSegmentControl(frame: .zero)
        control.frame      = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30)
        return control
    }()
    
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
    
    @IBOutlet weak var elementLabel: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementLowLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorImage: UIImageView!
    @IBOutlet weak var colorLowLabel: UILabel!
    @IBOutlet weak var planetLabel: UILabel!
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var planetLowLabel: UILabel!
    
    @IBOutlet weak var luckyDaysImage: UILabel!
    @IBOutlet weak var luckyDaysLabel: UILabel!
    
    private var menuControllerFPC      : FloatingPanelController!
    
    private var menuController         : MenuController!
    private var tomorrowMenuVC         : TomorrowMenuVC!
    private var weekMenuVC             : WeekMenuVC!
    private var monthMenuVC            : MonthMenuVC!
    
    private var scrollControll         : ScrollVC!
    
    private var calendarVC             : CalendarVC!
    
    let notifications = Notifications()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifications.requestNotification()
        notifications.scheduleNotification()
        if UserDefaults.standard.bool(forKey: "Registered") {
            zodiacSign = getZodiacSign(UserDefaults.standard.value(forKey: "DateOfBirth") as! Date)
            print(
                """
                ###########
                ###########
                ###########
                \(zodiacSign)
                ###########
                ###########
                ###########
                """)
        }
        
        if let image = UIImage(named: zodiacSign) {
            zodiacImageView.image = image
        }
        zodiacNameLabel.text = zodiacSign
        switch zodiacSign {
        case "Aquarius":
            dateLabel.text = "01.20 - 02.18"
            elementLowLabel.text = "Air"
            elementImage.image = UIImage(named: "Air")
            planetImage.image = UIImage(named: "Saturn")
            planetLowLabel.text = "Saturn"
            colorImage.image = UIImage(named: "Blue")
            colorLowLabel.text = "Blue"
            colorLowLabel.textColor = UIColor(red: 0.345, green: 0.518, blue: 1, alpha: 1)
            luckyDaysLabel.text = "Wednesday, Thursday, Sunday"
        case "Pisces":
            dateLabel.text = "02.19 - 03.20"
            elementLowLabel.text = "Water"
            elementImage.image = UIImage(named: "Water")
            planetImage.image = UIImage(named: "Jupiter")
            planetLowLabel.text = "Jupiter"
            colorImage.image = UIImage(named: "LightBlue")
            colorLowLabel.text = "Light Blue"
            colorLowLabel.textColor = UIColor(red: 0.153, green: 0.816, blue: 0.898, alpha: 1)
            luckyDaysLabel.text = "Tuesday, Thursday, Saturday"
        case "Aries":
            dateLabel.text = "03.21 - 04.19"
            elementLowLabel.text = "Fire"
            elementImage.image = UIImage(named: "Fire")
            planetImage.image = UIImage(named: "Mars")
            planetLowLabel.text = "Mars"
            colorImage.image = UIImage(named: "Red")
            colorLowLabel.text = "Red"
            colorLowLabel.textColor = UIColor(red: 1, green: 0.297, blue: 0.379, alpha: 1)
            luckyDaysLabel.text = "Tuesday, Thursday, Saturday"
        case "Taurus":
            dateLabel.text = "04.20 - 05.20"
            elementLowLabel.text = "Earth"
            elementImage.image = UIImage(named: "Earth")
            planetImage.image = UIImage(named: "Venus")
            planetLowLabel.text = "Venus"
            colorImage.image = UIImage(named: "Green")
            colorLowLabel.text = "Green"
            colorLowLabel.textColor = UIColor(red: 0.153, green: 0.898, blue: 0.631, alpha: 1)
            luckyDaysLabel.text = "Monday, Friday, Saturday"
        case "Gemini":
            dateLabel.text = "05.21 - 06.20"
            elementLowLabel.text = "Air"
            elementImage.image = UIImage(named: "Air")
            planetImage.image = UIImage(named: "Mercury")
            planetLowLabel.text = "Mercury"
            colorImage.image = UIImage(named: "Yellow")
            colorLowLabel.text = "Yellow"
            colorLowLabel.textColor = UIColor(red: 1, green: 0.786, blue: 0.027, alpha: 1)
            luckyDaysLabel.text = "Wednesday, Thursday, Friday"
        case "Cancer":
            dateLabel.text = "06.21 - 07.22"
            elementLowLabel.text = "Water"
            elementImage.image = UIImage(named: "Water")
            planetImage.image = UIImage(named: "Moon")
            planetLowLabel.text = "Moon"
            colorImage.image = UIImage(named: "Orange")
            colorLowLabel.text = "Orange"
            colorLowLabel.textColor = UIColor(red: 1, green: 0.584, blue: 0.201, alpha: 1)
            luckyDaysLabel.text = "Monday, Wednesday, Thursday"
        case "Leo":
            dateLabel.text = "07.23 - 08.22"
            elementLowLabel.text = "Fire"
            elementImage.image = UIImage(named: "Fire")
            planetImage.image = UIImage(named: "Sun")
            planetLowLabel.text = "Sun"
            colorImage.image = UIImage(named: "Yellow")
            colorLowLabel.text = "Yellow"
            colorLowLabel.textColor = UIColor(red: 1, green: 0.786, blue: 0.027, alpha: 1)
            luckyDaysLabel.text = "Monday, Thursday, Sunday"
        case "Virgo":
            dateLabel.text = "08.23 - 09.22"
            elementLowLabel.text = "Earth"
            elementImage.image = UIImage(named: "Earth")
            planetImage.image = UIImage(named: "Mercury")
            planetLowLabel.text = "Mercury"
            colorImage.image = UIImage(named: "Green")
            colorLowLabel.text = "Green"
            colorLowLabel.textColor = UIColor(red: 0.153, green: 0.898, blue: 0.631, alpha: 1)
            luckyDaysLabel.text = "Monday, Wednesday, Thursday"
        case "Libra":
            dateLabel.text = "09.23 - 10.22"
            elementLowLabel.text = "Air"
            elementImage.image = UIImage(named: "Air")
            planetImage.image = UIImage(named: "Venus")
            planetLowLabel.text = "Venus"
            colorImage.image = UIImage(named: "LightBlue")
            colorLowLabel.text = "Light Blue"
            colorLowLabel.textColor = UIColor(red: 0.153, green: 0.816, blue: 0.898, alpha: 1)
            luckyDaysLabel.text = "Monday, Friday, Saturday"
        case "Scorpio":
            dateLabel.text = "10.23 - 11.21"
            elementLowLabel.text = "Water"
            elementImage.image = UIImage(named: "Water")
            planetImage.image = UIImage(named: "Mars")
            planetLowLabel.text = "Mars"
            colorImage.image = UIImage(named: "Red")
            colorLowLabel.text = "Red"
            colorLowLabel.textColor = UIColor(red: 1, green: 0.297, blue: 0.379, alpha: 1)
            luckyDaysLabel.text = "Wednesday, Thursday, Sunday"
        case "Sagittarius":
            dateLabel.text = "11.22 - 12.21"
            elementLowLabel.text = "Fire"
            elementImage.image = UIImage(named: "Fire")
            planetImage.image = UIImage(named: "Jupiter")
            planetLowLabel.text = "Jupiter"
            colorImage.image = UIImage(named: "Purple")
            colorLowLabel.text = "Purple"
            colorLowLabel.textColor = UIColor(red: 0.588, green: 0.373, blue: 0.984, alpha: 1)
            luckyDaysLabel.text = "Wednesday, Thursday, Sunday"
        case "Capricorn":
            dateLabel.text = "12.22 - 01.19"
            elementLowLabel.text = "Earth"
            elementImage.image = UIImage(named: "Earth")
            planetImage.image = UIImage(named: "Saturn")
            planetLowLabel.text = "Saturn"
            colorImage.image = UIImage(named: "Orange")
            colorLowLabel.text = "Orange"
            colorLowLabel.textColor = UIColor(red: 1, green: 0.584, blue: 0.201, alpha: 1)
            luckyDaysLabel.text = "Monday, Friday, Saturday"
        default:
            dateLabel.text = ""
        }
        profileButton.addTarget(self, action: #selector(gotoSettingsVC), for: .touchUpInside)
        expandButton.addTarget(self, action: #selector(self.handleExpand), for: .touchUpInside)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setupFloatingPanel()
        setSegmentControl()
        setupSegmentControl()
    }
    
    let todayItem    = Item(icon: UIImage(), title: "Today".localized(),    isSelected: false)
    let tommorowItem = Item(icon: UserDefaults.standard.bool(forKey: "setProVersion") ? UIImage() : UIImage(named: "Locked")!, title: "Tommorow", isSelected: false)
    let weekItem     = Item(icon: UserDefaults.standard.bool(forKey: "setProVersion") ? UIImage() : UIImage(named: "Locked")!, title: "Week",     isSelected: false)
    let monthItem    = Item(icon: UserDefaults.standard.bool(forKey: "setProVersion") ? UIImage() : UIImage(named: "Locked")!, title: "Month",    isSelected: false)

    @objc
    private func gotoSettingsVC() {
        let settingsVC = SettingsVC()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    func setSegmentControl() {
        segmentControl.insertSegment(todayItem,    index: 0)
        segmentControl.insertSegment(tommorowItem, index: 1)
        segmentControl.insertSegment(weekItem,     index: 2)
        segmentControl.insertSegment(monthItem,    index: 3)
        segmentControl.setSelected(at: 0)
        segmentControl.onSegmentSelect = { [weak self] selectedIndex in
            guard let self = self else { return }
            UIView.animate(withDuration: 0.2, animations: {
                if selectedIndex == 0 {
                    currentFocus.0 = currentFocus.1
                    currentFocus.1 = 0
                    self.menuController.makeStandartState()
                } else if selectedIndex == 1 {
                    currentFocus.0 = currentFocus.1
                    currentFocus.1 = 1
                    self.menuController.makeTomorrowState()
                } else if selectedIndex == 2 {
                    currentFocus.0 = currentFocus.1
                    currentFocus.1 = 2
                    self.menuController.makeWeekState()
                } else if selectedIndex == 3 {
                    currentFocus.0 = currentFocus.1
                    currentFocus.1 = 3
                    self.menuController.makeMonthState()
                }
                self.segmentControl.setSelected(at: selectedIndex)
                if !UserDefaults.standard.bool(forKey: "setProVersion") {
                    self.menuController.makeStandartState()
                    self.segmentControl.openPayWall?()
                }
            })
        }
        segmentControl.openPayWall = { [weak self] in
            guard let self = self else { return }
            self.menuController.makeStandartState()
            let vc = MainPayWallVC()
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func setUpMenuControllerClosures() {
        
        menuController.onLockedSelect = {
            [weak self] in
            guard let self = self else { return }
            self.menuController.makeStandartState()
            let vc = MainPayWallVC()
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        menuController.onUNLockedSelect = {
            [weak self] (viewState) in
            guard let self = self else { return }
            self.calendarVC = CalendarVC()
            self.calendarVC.loadView()
            self.calendarVC.viewState = viewState
            self.navigationController?.pushViewController(self.calendarVC, animated: true)
        }
    }
    
    func setupFloatingPanel() {
        self.menuController    = MenuController()
        self.menuControllerFPC = FloatingPanelController()
        menuControllerFPC.delegate = self
        menuControllerFPC.surfaceView.backgroundColor = .clear
        menuControllerFPC.layout = MenuFloatingLayout()
        menuControllerFPC.surfaceView.appearance = FloatingPanelController.appereance()
        
        let appearance = SurfaceAppearance()
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: 0)
        shadow.radius = 30
        shadow.spread = 30
        shadow.opacity = 2
        appearance.shadows = [shadow]
        appearance.cornerRadius = 30.0
        menuControllerFPC.surfaceView.appearance = appearance
        setUpMenuControllerClosures()

        menuControllerFPC.set(contentViewController: menuController)
        menuControllerFPC.track(scrollView: menuController.tableView)
        menuControllerFPC.addPanel(toParent: self, animated: true)
        menuControllerFPC.surfaceView.grabberHandleSize = .init(width: 0, height: 0)
        menuController.makeStandartState()
        menuController.view.setNeedsLayout()
        UIView.performWithoutAnimation( { [weak self] in
            guard let self = self else { return }
            self.menuController.view.layoutIfNeeded()
        })
    }
    
    @objc
    func handleExpand() {
        if isExpand {
            isExpand = false
            self.expandButton.imageView?.transform = CGAffineTransform(rotationAngle: 0)
            UIView.animate(withDuration: 0.2) {
                self.menuControllerFPC.move(to: .half, animated: true)
            }
        } else {
            self.expandButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            isExpand = true
            UIView.animate(withDuration: 0.2) {
                self.menuControllerFPC.move(to: .tip, animated: true)
            }
        }
    }
}

extension HomeVC {
    
    func setupSegmentControl() {
        self.view.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentControl.heightAnchor.constraint(equalToConstant: 48),
            segmentControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            segmentControl.bottomAnchor.constraint(equalTo: menuController.view.topAnchor, constant: -10)
        ])
    }
}
