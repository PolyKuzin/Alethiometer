//
//  MenuController.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit

var selectedSegmentIndex = 0

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
        
        struct FocusToday    {
            let image : UIImage
            let title : String
            let onHeartTap  : (()->())
            let onCareerTap : (()->())
            let onFamilyTap : (()->())
            let onHealthTap : (()->())
            
            static let initial = ViewState.FocusToday(image: UIImage(), title: "", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {})
        }
        
        struct FocusTomorrow    {
            let image : UIImage
            let title : String
            let onHeartTap  : (()->())
            let onCareerTap : (()->())
            let onFamilyTap : (()->())
            let onHealthTap : (()->())
            
            static let initial = ViewState.FocusTomorrow(image: UIImage(), title: "", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {})
        }
        
        struct FocusWeek    {
            let image : UIImage
            let title : String
            let onHeartTap  : (()->())
            let onCareerTap : (()->())
            let onFamilyTap : (()->())
            let onHealthTap : (()->())
            
            static let initial = ViewState.FocusTomorrow(image: UIImage(), title: "", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {})
        }
        
        struct FocusMonth    {
            let image : UIImage
            let title : String
            let onHeartTap  : (()->())
            let onCareerTap : (()->())
            let onFamilyTap : (()->())
            let onHealthTap : (()->())
            
            static let initial = ViewState.FocusTomorrow(image: UIImage(), title: "", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {})
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
            if currentFocus.0 < currentFocus.1 {
                let transition = CATransition()
                transition.type = CATransitionType.push
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.fillMode = CAMediaTimingFillMode.forwards
                transition.duration = 0.25
                transition.subtype = CATransitionSubtype.fromRight
                self.tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
            } else {
                let transition = CATransition()
                transition.type = CATransitionType.push
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.fillMode = CAMediaTimingFillMode.forwards
                transition.duration = 0.25
                transition.subtype = CATransitionSubtype.fromLeft
                self.tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
            }
            self.tableView.reloadData()
        }
    }

    @IBOutlet weak var tableView : UITableView!
    
    func makeStandartState() {
        UserDefaults.standard.setValue(0, forKey: "currentState")
        viewState.rows.removeAll()
        if todayText != "" {
            viewState.rows.append(ViewState.Instant(image: UIImage(named: "flash 1")!, title: "Instant horoscope", body: todayText, onTap: {
                                                        [weak self] in
                                                        guard let self = self else { return }
                                                        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })}))
        }
        viewState.rows.append(ViewState.FocusToday(image: UIImage(named: "payWall-2")!, title: "Focus today", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
        viewState.rows.append(ViewState.Calendar(image: UIImage(named: "payWall-1")!, title: "Calendar", items: [
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1),
                                   downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), image: UIImage(named: "HaircutIcon")!, title: "Haircut", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), title: "Haircut", subtitle: "The lunar calendar of haircuts was compiled in ancient times, by long-term observations of the influence of the Moon on the health and growth of hair.", mouths: [[currentMounth.0 : days1.0],[nextMounth.0 : days1.1],[afterNextMounth.0 : days1.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), image: UIImage(named: "ManIcon")!, title: "Beginning", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "ManIcon")!, upcolor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1), downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), title: "Beginning", subtitle: "When you start a new business, you need to be mentally prepared, persistent, confident and unwavering, OR the best way is to look at favorable days in the app.", mouths: [[currentMounth.0 : days2.0],[nextMounth.0 : days2.1],[afterNextMounth.0 : days2.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), image: UIImage(named: "paint-brush 1")!, title: "Сreativity", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "paint-brush 1")!, upcolor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), title: "Сreativity", subtitle: "Understanding the properties of the planets and the features of each day will help you make the right choice, plan your business correctly, avoid trouble and attract good luck, save time and energy.", mouths: [[currentMounth.0 : days3.0],[nextMounth.0 : days3.1],[afterNextMounth.0 : days3.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1),
                                                 downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), image: UIImage(named: "Group")!, title: "Housework", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Group")!, upcolor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1), downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), title: "Housework", subtitle: "Look once in the calendar of household chores and try to adapt to its simple rules. You will feel that there is at least one more hour in the day, and you have at least one more hand! 🙂", mouths: [[currentMounth.0 : days4.0],[nextMounth.0 : days4.1],[afterNextMounth.0 : days4.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1),
                                                 downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), image: UIImage(named: "green-tea 1")!, title: "Garden", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "green-tea 1")!, upcolor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1), downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), title: "Garden", subtitle: "Follow our calendar so that you do not miss the favorable days for working in the garden in 2021. These days, both the mood and free time should coincide!", mouths: [[currentMounth.0 : days5.0],[nextMounth.0 : days5.1],[afterNextMounth.0 : days5.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), image: UIImage(named: "dollar 1")!, title: "Cash transactions", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "dollar 1")!, upcolor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1), downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), title: "Cash transactions", subtitle: "Money is an outgoing and incoming object. How do I attract money and hold it back? The calendar will tell you the most favorable and successful days to attract money.", mouths: [[currentMounth.0 : days6.0],[nextMounth.0 : days6.1],[afterNextMounth.0 : days6.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), image: UIImage(named: "graduation-hat 1")!, title: "Study", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "graduation-hat 1")!, upcolor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1), downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), title: "Study", subtitle: "If you need to remember some important things-it is best to do it on certain days. The accumulated knowledge of previous generations revealed a pattern in the days when it is best to learn.", mouths: [[currentMounth.0 : days7.0],[nextMounth.0 : days7.1],[afterNextMounth.0 : days7.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1),
                                                 downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), image: UIImage(named: "running 1")!, title: "Sport", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "running 1")!, upcolor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1), downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), title: "Sport", subtitle: "The best time for any endeavor is the days when the mood and activity coincide, take this into account before going to the gym.", mouths: [[currentMounth.0 : days8.0],[nextMounth.0 : days8.1],[afterNextMounth.0 : days8.2]]))
                                                 }])
        ]))
    }
    
    func makeTomorrowState() {
        UserDefaults.standard.setValue(1, forKey: "currentState")
        viewState.rows.removeAll()
        if tomorrowText != "" {
            viewState.rows.append(ViewState.Instant(image: UIImage(named: "flash 1")!, title: "Instant horoscope", body: tomorrowText, onTap: {
                                                        [weak self] in
                                                        guard let self = self else { return }
                                                        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })}))
        }
        viewState.rows.append(ViewState.FocusTomorrow(image: UIImage(named: "payWall-2")!, title: "Focus tomorrow", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
        viewState.rows.append(ViewState.Calendar(image: UIImage(named: "payWall-1")!, title: "Calendar", items: [
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1),
                                   downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), image: UIImage(named: "HaircutIcon")!, title: "Haircut", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), title: "Haircut", subtitle: "The lunar calendar of haircuts was compiled in ancient times, by long-term observations of the influence of the Moon on the health and growth of hair.", mouths: [[currentMounth.0 : days1.0],[nextMounth.0 : days1.1],[afterNextMounth.0 : days1.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), image: UIImage(named: "ManIcon")!, title: "Beginning", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "ManIcon")!, upcolor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1), downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), title: "Beginning", subtitle: "When you start a new business, you need to be mentally prepared, persistent, confident and unwavering, OR the best way is to look at favorable days in the app.", mouths: [[currentMounth.0 : days2.0],[nextMounth.0 : days2.1],[afterNextMounth.0 : days2.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), image: UIImage(named: "paint-brush 1")!, title: "Сreativity", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "paint-brush 1")!, upcolor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), title: "Сreativity", subtitle: "Understanding the properties of the planets and the features of each day will help you make the right choice, plan your business correctly, avoid trouble and attract good luck, save time and energy.", mouths: [[currentMounth.0 : days3.0],[nextMounth.0 : days3.1],[afterNextMounth.0 : days3.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1),
                                                 downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), image: UIImage(named: "Group")!, title: "Housework", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Group")!, upcolor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1), downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), title: "Housework", subtitle: "Look once in the calendar of household chores and try to adapt to its simple rules. You will feel that there is at least one more hour in the day, and you have at least one more hand! 🙂", mouths: [[currentMounth.0 : days4.0],[nextMounth.0 : days4.1],[afterNextMounth.0 : days4.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1),
                                                 downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), image: UIImage(named: "green-tea 1")!, title: "Garden", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "green-tea 1")!, upcolor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1), downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), title: "Garden", subtitle: "Follow our calendar so that you do not miss the favorable days for working in the garden in 2021. These days, both the mood and free time should coincide!", mouths: [[currentMounth.0 : days5.0],[nextMounth.0 : days5.1],[afterNextMounth.0 : days5.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), image: UIImage(named: "dollar 1")!, title: "Cash transactions", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "dollar 1")!, upcolor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1), downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), title: "Cash transactions", subtitle: "Money is an outgoing and incoming object. How do I attract money and hold it back? The calendar will tell you the most favorable and successful days to attract money.", mouths: [[currentMounth.0 : days6.0],[nextMounth.0 : days6.1],[afterNextMounth.0 : days6.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), image: UIImage(named: "graduation-hat 1")!, title: "Study", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "graduation-hat 1")!, upcolor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1), downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), title: "Study", subtitle: "If you need to remember some important things-it is best to do it on certain days. The accumulated knowledge of previous generations revealed a pattern in the days when it is best to learn.", mouths: [[currentMounth.0 : days7.0],[nextMounth.0 : days7.1],[afterNextMounth.0 : days7.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1),
                                                 downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), image: UIImage(named: "running 1")!, title: "Sport", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "running 1")!, upcolor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1), downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), title: "Sport", subtitle: "The best time for any endeavor is the days when the mood and activity coincide, take this into account before going to the gym.", mouths: [[currentMounth.0 : days8.0],[nextMounth.0 : days8.1],[afterNextMounth.0 : days8.2]]))
                                                 }])
        ]))
    }
    
    func makeWeekState() {
        UserDefaults.standard.setValue(2, forKey: "currentState")
        viewState.rows.removeAll()
        if weekText != "" {
            viewState.rows.append(ViewState.Instant(image: UIImage(named: "flash 1")!, title: "Instant horoscope", body: weekText, onTap: {
                                                        [weak self] in
                                                        guard let self = self else { return }
                                                        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })}))
        }
        viewState.rows.append(ViewState.FocusWeek(image: UIImage(named: "payWall-2")!, title: "Week focus", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
        viewState.rows.append(ViewState.Calendar(image: UIImage(named: "payWall-1")!, title: "Calendar", items: [
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1),
                                   downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), image: UIImage(named: "HaircutIcon")!, title: "Haircut", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), title: "Haircut", subtitle: "The lunar calendar of haircuts was compiled in ancient times, by long-term observations of the influence of the Moon on the health and growth of hair.", mouths: [[currentMounth.0 : days1.0],[nextMounth.0 : days1.1],[afterNextMounth.0 : days1.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), image: UIImage(named: "ManIcon")!, title: "Beginning", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "ManIcon")!, upcolor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1), downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), title: "Beginning", subtitle: "When you start a new business, you need to be mentally prepared, persistent, confident and unwavering, OR the best way is to look at favorable days in the app.", mouths: [[currentMounth.0 : days2.0],[nextMounth.0 : days2.1],[afterNextMounth.0 : days2.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), image: UIImage(named: "paint-brush 1")!, title: "Сreativity", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "paint-brush 1")!, upcolor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), title: "Сreativity", subtitle: "Understanding the properties of the planets and the features of each day will help you make the right choice, plan your business correctly, avoid trouble and attract good luck, save time and energy.", mouths: [[currentMounth.0 : days3.0],[nextMounth.0 : days3.1],[afterNextMounth.0 : days3.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1),
                                                 downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), image: UIImage(named: "Group")!, title: "Housework", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Group")!, upcolor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1), downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), title: "Housework", subtitle: "Look once in the calendar of household chores and try to adapt to its simple rules. You will feel that there is at least one more hour in the day, and you have at least one more hand! 🙂", mouths: [[currentMounth.0 : days4.0],[nextMounth.0 : days4.1],[afterNextMounth.0 : days4.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1),
                                                 downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), image: UIImage(named: "green-tea 1")!, title: "Garden", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "green-tea 1")!, upcolor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1), downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), title: "Garden", subtitle: "Follow our calendar so that you do not miss the favorable days for working in the garden in 2021. These days, both the mood and free time should coincide!", mouths: [[currentMounth.0 : days5.0],[nextMounth.0 : days5.1],[afterNextMounth.0 : days5.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), image: UIImage(named: "dollar 1")!, title: "Cash transactions", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "dollar 1")!, upcolor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1), downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), title: "Cash transactions", subtitle: "Money is an outgoing and incoming object. How do I attract money and hold it back? The calendar will tell you the most favorable and successful days to attract money.", mouths: [[currentMounth.0 : days6.0],[nextMounth.0 : days6.1],[afterNextMounth.0 : days6.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), image: UIImage(named: "graduation-hat 1")!, title: "Study", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "graduation-hat 1")!, upcolor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1), downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), title: "Study", subtitle: "If you need to remember some important things-it is best to do it on certain days. The accumulated knowledge of previous generations revealed a pattern in the days when it is best to learn.", mouths: [[currentMounth.0 : days7.0],[nextMounth.0 : days7.1],[afterNextMounth.0 : days7.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1),
                                                 downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), image: UIImage(named: "running 1")!, title: "Sport", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "running 1")!, upcolor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1), downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), title: "Sport", subtitle: "The best time for any endeavor is the days when the mood and activity coincide, take this into account before going to the gym.", mouths: [[currentMounth.0 : days8.0],[nextMounth.0 : days8.1],[afterNextMounth.0 : days8.2]]))
                                                 }])
        ]))
    }
    
    func makeMonthState() {
        UserDefaults.standard.setValue(3, forKey: "currentState")
        viewState.rows.removeAll()
        if monthText != "" {
            viewState.rows.append(ViewState.Instant(image: UIImage(named: "flash 1")!, title: "Instant horoscope", body: monthText, onTap: {
                                                        [weak self] in
                                                        guard let self = self else { return }
                                                        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })}))
        }
        viewState.rows.append(ViewState.FocusMonth(image: UIImage(named: "payWall-2")!, title: "Month focus", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
        viewState.rows.append(ViewState.Calendar(image: UIImage(named: "payWall-1")!, title: "Calendar", items: [
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1),
                                   downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), image: UIImage(named: "HaircutIcon")!, title: "Haircut", isLocked: false, onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Relate")!, upcolor: UIColor(red: 1, green: 0.874, blue: 0.426, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.495, alpha: 1), title: "Haircut", subtitle: "The lunar calendar of haircuts was compiled in ancient times, by long-term observations of the influence of the Moon on the health and growth of hair.", mouths: [[currentMounth.0 : days1.0],[nextMounth.0 : days1.1],[afterNextMounth.0 : days1.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), image: UIImage(named: "ManIcon")!, title: "Beginning", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "ManIcon")!, upcolor: UIColor(red: 0.472, green: 0.873, blue: 1, alpha: 1), downColor: UIColor(red: 0.56, green: 0.522, blue: 1, alpha: 1), title: "Beginning", subtitle: "When you start a new business, you need to be mentally prepared, persistent, confident and unwavering, OR the best way is to look at favorable days in the app.", mouths: [[currentMounth.0 : days2.0],[nextMounth.0 : days2.1],[afterNextMounth.0 : days2.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), image: UIImage(named: "paint-brush 1")!, title: "Сreativity", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "paint-brush 1")!, upcolor: UIColor(red: 1, green: 0.676, blue: 0.87, alpha: 1), downColor: UIColor(red: 1, green: 0.426, blue: 0.874, alpha: 1), title: "Сreativity", subtitle: "Understanding the properties of the planets and the features of each day will help you make the right choice, plan your business correctly, avoid trouble and attract good luck, save time and energy.", mouths: [[currentMounth.0 : days3.0],[nextMounth.0 : days3.1],[afterNextMounth.0 : days3.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1),
                                                 downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), image: UIImage(named: "Group")!, title: "Housework", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "Group")!, upcolor: UIColor(red: 0.529, green: 0.967, blue: 0.914, alpha: 1), downColor: UIColor(red: 0.327, green: 0.803, blue: 0.834, alpha: 1), title: "Housework", subtitle: "Look once in the calendar of household chores and try to adapt to its simple rules. You will feel that there is at least one more hour in the day, and you have at least one more hand! 🙂", mouths: [[currentMounth.0 : days4.0],[nextMounth.0 : days4.1],[afterNextMounth.0 : days4.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1),
                                                 downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), image: UIImage(named: "green-tea 1")!, title: "Garden", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "green-tea 1")!, upcolor: UIColor(red: 0.41, green: 0.971, blue: 0.803, alpha: 1), downColor: UIColor(red: 0, green: 0.671, blue: 0.429, alpha: 1), title: "Garden", subtitle: "Follow our calendar so that you do not miss the favorable days for working in the garden in 2021. These days, both the mood and free time should coincide!", mouths: [[currentMounth.0 : days5.0],[nextMounth.0 : days5.1],[afterNextMounth.0 : days5.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1),
                                                 downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), image: UIImage(named: "dollar 1")!, title: "Cash transactions", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "dollar 1")!, upcolor: UIColor(red: 1, green: 0.605, blue: 0.605, alpha: 1), downColor: UIColor(red: 1, green: 0.309, blue: 0.641, alpha: 1), title: "Cash transactions", subtitle: "Money is an outgoing and incoming object. How do I attract money and hold it back? The calendar will tell you the most favorable and successful days to attract money.", mouths: [[currentMounth.0 : days6.0],[nextMounth.0 : days6.1],[afterNextMounth.0 : days6.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1),
                                                 downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), image: UIImage(named: "graduation-hat 1")!, title: "Study", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "graduation-hat 1")!, upcolor: UIColor(red: 0.904, green: 0.747, blue: 1, alpha: 1), downColor: UIColor(red: 0.776, green: 0.409, blue: 1, alpha: 1), title: "Study", subtitle: "If you need to remember some important things-it is best to do it on certain days. The accumulated knowledge of previous generations revealed a pattern in the days when it is best to learn.", mouths: [[currentMounth.0 : days7.0],[nextMounth.0 : days7.1],[afterNextMounth.0 : days7.2]]))
                                                 }]),
            CalendarCell.ViewState(upColor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1),
                                                 downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), image: UIImage(named: "running 1")!, title: "Sport", isLocked: !UserDefaults.standard.bool(forKey: "setProVersion"), onSelect: [{
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onLockedSelect?()
                                                 }, {
                                                    [weak self] in
                                                    guard self != nil else { return }
                                                    self?.onUNLockedSelect?(CalendarVC.ViewState(icon: UIImage(named: "running 1")!, upcolor: UIColor(red: 1, green: 0.907, blue: 0.726, alpha: 1), downColor: UIColor(red: 0.963, green: 0.814, blue: 0.286, alpha: 1), title: "Sport", subtitle: "The best time for any endeavor is the days when the mood and activity coincide, take this into account before going to the gym.", mouths: [[currentMounth.0 : days8.0],[nextMounth.0 : days8.1],[afterNextMounth.0 : days8.2]]))
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
        
        days1.0 = UserDefaults.standard.object(forKey: "days1.0") as! [Int]
        days1.1 = UserDefaults.standard.object(forKey: "days1.1") as! [Int]
        days1.2 = UserDefaults.standard.object(forKey: "days1.2") as! [Int]
        
        days2.0 = UserDefaults.standard.object(forKey: "days2.0") as! [Int]
        days2.1 = UserDefaults.standard.object(forKey: "days2.1") as! [Int]
        days2.2 = UserDefaults.standard.object(forKey: "days2.2") as! [Int]
        
        days3.0 = UserDefaults.standard.object(forKey: "days3.0") as! [Int]
        days3.1 = UserDefaults.standard.object(forKey: "days3.1") as! [Int]
        days3.2 = UserDefaults.standard.object(forKey: "days3.2") as! [Int]
        
        days4.0 = UserDefaults.standard.object(forKey: "days4.0") as! [Int]
        days4.1 = UserDefaults.standard.object(forKey: "days4.1") as! [Int]
        days4.2 = UserDefaults.standard.object(forKey: "days4.2") as! [Int]
        
        days5.0 = UserDefaults.standard.object(forKey: "days5.0") as! [Int]
        days5.1 = UserDefaults.standard.object(forKey: "days5.1") as! [Int]
        days5.2 = UserDefaults.standard.object(forKey: "days5.2") as! [Int]
        
        days6.0 = UserDefaults.standard.object(forKey: "days6.0") as! [Int]
        days6.1 = UserDefaults.standard.object(forKey: "days6.1") as! [Int]
        days6.2 = UserDefaults.standard.object(forKey: "days6.2") as! [Int]
        
        days7.0 = UserDefaults.standard.object(forKey: "days7.0") as! [Int]
        days7.1 = UserDefaults.standard.object(forKey: "days7.1") as! [Int]
        days7.2 = UserDefaults.standard.object(forKey: "days7.2") as! [Int]

        days8.0 = UserDefaults.standard.object(forKey: "days8.0") as! [Int]
        days8.1 = UserDefaults.standard.object(forKey: "days8.1") as! [Int]
        days8.2 = UserDefaults.standard.object(forKey: "days8.2") as! [Int]
    }
    
    private func makeTransition(with type: CATransitionSubtype) {
        let transition = CATransition()
        transition.type = CATransitionType.push
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.fillMode = CAMediaTimingFillMode.forwards
        transition.duration = 0.25
        transition.subtype = type
        self.tableView.layer.add(transition, forKey: "UITableViewReloadDataAnimationKey")
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
        case is ViewState.FocusToday:
            let data = viewState.rows[indexPath.row] as! ViewState.FocusToday
            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
            cell.selectionStyle = .none
            cell.viewState.image = data.image
            cell.viewState.title = data.title
            return cell
        case is ViewState.FocusTomorrow:
            let data = viewState.rows[indexPath.row] as! ViewState.FocusTomorrow
            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
            cell.selectionStyle = .none
            cell.viewState.image = data.image
            cell.viewState.title = data.title
            return cell
        case is ViewState.FocusWeek:
            let data = viewState.rows[indexPath.row] as! ViewState.FocusWeek
            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
            cell.selectionStyle = .none
            cell.viewState.image = data.image
            cell.viewState.title = data.title
            return cell
        case is ViewState.FocusMonth:
            let data = viewState.rows[indexPath.row] as! ViewState.FocusMonth
            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
            cell.selectionStyle = .none
            cell.viewState.image = data.image
            cell.viewState.title = data.title
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
