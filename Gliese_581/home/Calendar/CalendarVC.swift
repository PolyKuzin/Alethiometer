//
//  CalendarVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 26.12.2020.
//

import UIKit

var currentMounth = ("БЛЯЯЯЯЯЯЯЯ", 31)
var nextMounth    = ("ПОЖАЛУЙСТАААА", 31)
var afterNextMounth = ("ДААААААААА", 28)

var monthsName = [currentMounth.0, nextMounth.0, afterNextMounth.0]
var monthsDays = [currentMounth.1, nextMounth.1, afterNextMounth.1]
class CalendarVC: BaseVC {
    
    var days : [Int]?

    @IBOutlet weak var containerView  : UIView!
    @IBOutlet weak var iconView       : UIImageView!
    @IBOutlet weak var titleLabel     : UILabel!
    @IBOutlet weak var subtitleLabel  : UILabel!
    @IBOutlet weak var tableView      : UITableView!
    
    
    struct ViewState {
        let icon         : UIImage
        let upcolor      : UIColor
        let downColor    : UIColor
        let title        : String
        let subtitle     : String
        let mouths       : [[String : [Int]]]
        
        static let initial = ViewState(icon: UIImage(named: "MaleGender")!, upcolor: UIColor.clear, downColor: UIColor.clear, title: "", subtitle: "", mouths: [])
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            tableView.register(UINib(nibName: MounthCell.reuseID, bundle: nil), forCellReuseIdentifier: MounthCell.reuseID)
            tableView.delegate = self
            tableView.dataSource = self
            getTotalDate(Calendar.current.component(.month, from: Date()))
            iconView.image = viewState.icon
            containerView.setGradientBackground(upColor: viewState.upcolor, downColor: viewState.downColor)
            titleLabel.text = viewState.title
            subtitleLabel.text = viewState.subtitle
            view.backgroundColor = UIColor.background
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getTotalDate(_ currentMounth: Int){
        var current = currentMounth
        var dateComponents = DateComponents()
        dateComponents.year = Calendar.current.component(.year, from: Date())
        var i = 1
        while i < 4 {
            dateComponents.month = current
            let calendar = Calendar.current
            let datez = calendar.date(from: dateComponents)
            let interval = calendar.dateInterval(of: .month, for: datez!)!

            let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
            print(days)
            self.days?.append(days)
            i += 1
            current += 1
        }
    }
}

extension CalendarVC : UITableViewDelegate { }

extension CalendarVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewState.mouths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewState.mouths[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MounthCell.reuseID, for: indexPath) as! MounthCell
        cell.viewState.name = monthsName[indexPath.row]
        cell.viewState.days = monthsDays[indexPath.row]
        cell.viewState.circled = data.values.first ?? []
        return cell
    }
}
