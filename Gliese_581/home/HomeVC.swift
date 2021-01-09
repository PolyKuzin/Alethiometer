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
    
    private let segmentControl: ScrollableSegmentControl = {
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
    
    private var menuControllerFPC      : FloatingPanelController!
    
    private var menuController         : MenuController!
    private var tomorrowMenuVC         : TomorrowMenuVC!
    private var weekMenuVC             : WeekMenuVC!
    private var monthMenuVC            : MonthMenuVC!
    
    private var scrollControll         : ScrollVC!
    
    private var calendarVC             : CalendarVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let image = UIImage(named: zodiacSign) {
            zodiacImageView.image = image
        }
        zodiacNameLabel.text = zodiacSign
        switch zodiacSign {
        case "Aquarius":
            dateLabel.text = "01.20 - 02.18"
        case "Pisces":
            dateLabel.text = "02.19 - 03.20"
        case "Aries":
            dateLabel.text = "03.21 - 04.19"
        case "Taurus":
            dateLabel.text = "04.20 - 05.20"
        case "Gemini":
            dateLabel.text = "05.21 - 06.20"
        case "Cancer":
            dateLabel.text = "06.21 - 07.22"
        case "Leo":
            dateLabel.text = "07.23 - 08.22"
        case "Virgo":
            dateLabel.text = "08.23 - 09.22"
        case "Libra":
            dateLabel.text = "09.23 - 10.22"
        case "Scorpio":
            dateLabel.text = "10.23 - 11.21"
        case "Sagittarius":
            dateLabel.text = "11.22 - 12.21"
        case "Capricorn":
            dateLabel.text = "12.22 - 01.19"
        default:
            dateLabel.text = ""
        }
        expandButton.addTarget(self, action: #selector(self.handleExpand), for: .touchUpInside)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setupFloatingPanel()
        setSegmentControl()
        setupSegmentControl()
    }
    
    let todayItem    = Item(icon: UIImage(), title: "Today",    isSelected: false)
    let tommorowItem = Item(icon: UIImage(), title: "Tommorow", isSelected: false)
    let weekItem     = Item(icon: UIImage(), title: "Week",     isSelected: false)
    let monthItem    = Item(icon: UIImage(), title: "Month",    isSelected: false)

    func setSegmentControl() {
        segmentControl.insertSegment(todayItem, index: 0)
        segmentControl.insertSegment(tommorowItem,   index: 1)
        segmentControl.insertSegment(weekItem,     index: 2)
        segmentControl.insertSegment(monthItem,     index: 3)
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
            })
        }
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
