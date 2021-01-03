//
//  MenuController.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit

class MenuController: BaseVC {
    
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

    @IBOutlet weak var tableView : UITableView!
    
    func makeStandartState() {
        viewState.rows.append(ViewState.Instant(image: UIImage(), title: "Instant horoscope", body: "Трудно сосредоточиться. Вы с энтузиазмом беретесь за дела, но довести начатое до конца удается не всегда. Из-за сгоряча сказанных слов вы можете лишиться поддерж...Трудно сосредоточиться. Вы с энтузиазмом беретесь за дела, но довести начатое до конца удается не всегда. Из-за сгоряча сказанных слов вы можете лишиться поддерж...Трудно сосредоточиться. Вы с энтузиазмом беретесь за дела, но довести начатое до конца удается не всегда. Из-за сгоряча сказанных слов вы можете лишиться поддерж...Трудно сосредоточиться. Вы с энтузиазмом беретесь за дела, но довести начатое до конца удается не всегда. Из-за сгоряча сказанных слов вы можете лишиться поддерж...", onTap: {
                                                    [weak self] in
                                                    guard let self = self else { return }
                                                    UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })}))
        viewState.rows.append(ViewState.Focus(image: UIImage(), title: "Focus today", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
        viewState.rows.append(ViewState.Calendar(image: UIImage(), title: "Calendar", items: [
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1),
                                   downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), image: UIImage(named: "Relate")!, title: "HairCut", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), title: "HairCut", subtitle: "В эти дни настолько охуенно стричься что просто пздц охуеть efsefsefsefsfsefsefsefsefsefsefsefsefse", mouths: [[currentMounth.0 : [14, 15, 16]],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                [nextMounth.0 : [2, 4, 9]],
                                                                                                                                                                                                                                                                [afterNextMounth.0 : [12, 22, 21]]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), image: UIImage(named: "Relate")!, title: "Beginning", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1), downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), title: "Beginning", subtitle: "", mouths: []))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), image: UIImage(named: "Relate")!, title: "Сreativity", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), title: "Сreativity", subtitle: "", mouths: []))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1),
                                                 downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), image: UIImage(named: "Relate")!, title: "Housework", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1), downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), title: "Housework", subtitle: "", mouths: []))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1),
                                                 downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), image: UIImage(named: "Relate")!, title: "Garden", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1), downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), title: "Garden", subtitle: "", mouths: []))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), image: UIImage(named: "Relate")!, title: "Cash transactions", isLocked: true, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1), downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), title: "Cash transactions", subtitle: "", mouths: []))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), image: UIImage(named: "Relate")!, title: "Study", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1), downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), title: "Study", subtitle: "", mouths: []))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1),
                                                 downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), image: UIImage(named: "Relate")!, title: "Sport", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1), downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), title: "Sport", subtitle: "", mouths: []))
                                                 }])
        ]))
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

extension MenuController : UITableViewDelegate { }

extension MenuController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewState.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewState.rows[indexPath.row] {
        case is ViewState.Instant:
            let data = viewState.rows[indexPath.row] as! ViewState.Instant
            let cell = tableView.dequeueReusableCell(withIdentifier: InstanceHoroscopeCell.reuseID) as! InstanceHoroscopeCell
            cell.selectionStyle = .none
            cell.viewState = data
            return cell
        case is ViewState.Focus:
            let data = viewState.rows[indexPath.row] as! ViewState.Focus
            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
            cell.selectionStyle = .none
            cell.viewState = data
            return cell
        case is ViewState.Calendar:
            let data = viewState.rows[indexPath.row] as! ViewState.Calendar
            let cell = tableView.dequeueReusableCell(withIdentifier: CalendarCell.reuseID) as! CalendarCell
            cell.selectionStyle = .none
            cell.viewState = data
            return cell
        default:
            return UITableViewCell()
        }
    }
}
