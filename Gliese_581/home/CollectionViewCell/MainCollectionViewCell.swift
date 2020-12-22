//
//  MainCollectionViewCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 16.12.2020.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "MainCollectionViewCell"
    
    @IBOutlet weak var tableView : UITableView!
    
    struct ViewState {
        
        var rows : [Any]
        
        struct Instant  {
            let image : UIImage
            let title : String
            let body  : String
            let onTap : (()->())
        }
        
        struct Focus    {
            let image : UIImage
            let title : String
            let onHeartTap  : (()->())
            let onCareerTap : (()->())
            let onFamilyTap : (()->())
            let onHealthTap : (()->())
        }
        
        struct Calendar {
            let image : UIImage
            let title : String
            let body  : String
            let onTap : (()->())
        }
        
        static let initial = ViewState(rows: [])
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            tableView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        viewState.rows.append(ViewState.Instant(image: UIImage(), title: "Instant horoscope", body: "Трудно сосредоточиться. Вы с энтузиазмом беретесь за дела, но довести начатое до конца удается не всегда. Из-за сгоряча сказанных слов вы можете лишиться поддерж...", onTap: {}))
        viewState.rows.append(ViewState.Focus(image: UIImage(), title: "Focus today", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {}))
//        viewState.rows.append(ViewState.Calendar(image: UIImage(), title: "Calendar", body: "", onTap: {}))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.234, alpha: 1)
        tableView.roundCorners(.top, radius: 30)
        tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: InstanceHoroscopeCell.reuseID, bundle: nil), forCellReuseIdentifier: InstanceHoroscopeCell.reuseID)
        tableView.register(UINib(nibName: FocusCell.reuseID, bundle: nil), forCellReuseIdentifier: FocusCell.reuseID)
    }
}

extension MainCollectionViewCell: UITableViewDelegate {
    
}

extension MainCollectionViewCell : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewState.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewState.rows[indexPath.row] {
        case is ViewState.Instant:
//            let data = viewState.rows[indexPath.row] as! ViewState.Instant
            let cell = tableView.dequeueReusableCell(withIdentifier: InstanceHoroscopeCell.reuseID) as! InstanceHoroscopeCell
            cell.selectionStyle = .none
            return cell
        case is ViewState.Focus:
//            let data = viewState.rows[indexPath.row] as! ViewState.Focus
            let cell = tableView.dequeueReusableCell(withIdentifier: FocusCell.reuseID) as! FocusCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
}
