//
//  CalendarVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 26.12.2020.
//

import UIKit

class CalendarVC: BaseVC {

//    @IBOutlet weak var containerView  : UIView!
//    @IBOutlet weak var iconView       : UIImageView!
//    @IBOutlet weak var titleLabel     : UILabel!
//    @IBOutlet weak var subtitleLabel  : UILabel!
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
            tableView.register(UINib(nibName: TitleCell.reuseID, bundle: nil), forCellReuseIdentifier: TitleCell.reuseID)
            tableView.delegate = self
            tableView.dataSource = self
//            iconView.image = viewState.icon
//            containerView.setGradientBackground(upColor: viewState.upcolor, downColor: viewState.downColor)
//            titleLabel.text = viewState.title
//            subtitleLabel.text = viewState.subtitle
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
}

extension CalendarVC : UITableViewDelegate { }

extension CalendarVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewState.mouths.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.reuseID, for: indexPath) as! TitleCell
            cell.viewState.title = viewState.title
            cell.viewState.subTitle = viewState.subtitle
            cell.selectionStyle = .none
            return cell
        }
        let data = viewState.mouths[indexPath.row - 1]
        let cell = tableView.dequeueReusableCell(withIdentifier: MounthCell.reuseID, for: indexPath) as! MounthCell
        cell.viewState.name = monthsName[indexPath.row - 1]
        cell.viewState.days = monthsDays[indexPath.row - 1]
        cell.viewState.circled = data.values.first ?? []
        cell.selectionStyle = .none
        return cell
    }
}
