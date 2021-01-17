//
//  MonthMenuVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.01.2021.
//
import UIKit

class MonthMenuVC: BaseVC {
    
    var onLockedSelect   : (()->())?
    var onUNLockedSelect : ((CalendarVC.ViewState)->())?

    struct ViewState {
        
        var rows : [Any]
        
        struct Instant  {
            let image : UIImage
            let title : String
            let body  : String
            let onTap : (()->())
            
            static let initial = ViewState.Instant(image: UIImage(), title: "", body: "", onTap: {})
        }
        
        struct Focus    {
            let image : UIImage
            let title : String
            let onHeartTap  : (()->())
            let onCareerTap : (()->())
            let onFamilyTap : (()->())
            let onHealthTap : (()->())
            
            static let initial = ViewState.Focus(image: UIImage(), title: "", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {})
        }
        
        struct Calendar {
            let image : UIImage
            let title : String
            let items : [CalendarCell.ViewState]
            
            static let initial = ViewState.Calendar(image: UIImage(), title: "", items: [])
        }
        
        static let initial = ViewState(rows: [])
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    func makeStandartState() {
        viewState.rows.append(ViewState.Instant(image: UIImage(named: "flash 1")!, title: "Instant horoscope", body: todayText, onTap: {
                                                    [weak self] in
                                                    guard let self = self else { return }
                                                    UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })}))
        viewState.rows.append(ViewState.Focus(image: UIImage(named: "payWall-2")!, title: "Focus today", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.234, alpha: 1)

        tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: InstanceHoroscopeCell.reuseID, bundle: nil), forCellReuseIdentifier: InstanceHoroscopeCell.reuseID)
        tableView.register(UINib(nibName: FocusCell.reuseID, bundle: nil), forCellReuseIdentifier: FocusCell.reuseID)
        tableView.register(UINib(nibName: CalendarCell.reuseID, bundle: nil), forCellReuseIdentifier: CalendarCell.reuseID)
    }
}

extension MonthMenuVC : UITableViewDelegate { }

extension MonthMenuVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewState.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewState.rows[indexPath.row] {
        case is ViewState.Instant:
            let data = viewState.rows[indexPath.row] as! ViewState.Instant
            let cell = tableView.dequeueReusableCell(withIdentifier: InstanceHoroscopeCell.reuseID) as! InstanceHoroscopeCell
            cell.selectionStyle = .none
            cell.viewState = MenuController.ViewState.Instant(image: data.image, title: data.title, body: data.body, onTap: data.onTap)
            return cell
//        case is ViewState.Focus:
//            let data = viewState.rows[indexPath.row] as! ViewState.Focus
//            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
//            cell.selectionStyle = .none
//            cell.viewState = MenuController.ViewState.FocusToday(image: data.image, title: data.title, onHeartTap: data.onHealthTap, onCareerTap: data.onCareerTap, onFamilyTap: data.onFamilyTap, onHealthTap: data.onFamilyTap)
//            return cell
        case is ViewState.Calendar:
            let data = viewState.rows[indexPath.row] as! ViewState.Calendar
            let cell = tableView.dequeueReusableCell(withIdentifier: CalendarCell.reuseID) as! CalendarCell
            cell.selectionStyle = .none
            cell.viewState = MenuController.ViewState.Calendar(image: data.image, title: data.title, items: data.items)
            return cell
        default:
            return UITableViewCell()
        }
    }
}



