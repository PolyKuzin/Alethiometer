//
//  CalendarVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 26.12.2020.
//

import UIKit

class CalendarVC: BaseVC {
    
    var days : [Int]?

    @IBOutlet weak var containerView  : UIView!
    @IBOutlet weak var iconView       : UIImageView!
    @IBOutlet weak var titleLabel     : UILabel!
    @IBOutlet weak var subtitleLabel  : UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    
    struct ViewState {
        let icon         : UIImage
        let upcolor      : UIColor
        let downColor    : UIColor
        let title        : String
        let subtitle     : String
        let current      : [Int]
        let next         : [Int]
        let afterTheNext : [Int]
        
        static let initial = ViewState(icon: UIImage(named: "MaleGender")!, upcolor: UIColor.clear, downColor: UIColor.clear, title: "", subtitle: "", current: [], next: [], afterTheNext: [])
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            getTotalDate(Calendar.current.component(.month, from: Date()))
            iconView.image = viewState.icon
            containerView.setGradientBackground(upColor: viewState.upcolor, downColor: viewState.downColor)
            titleLabel.text = viewState.title
            subtitleLabel.text = viewState.subtitle
            view.backgroundColor = UIColor.background
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
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

extension CalendarVC : UICollectionViewDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
//            switch indexPath.section {
//            case 0:
//                sectionHeader.label.text = Date().month
//            case 1:
//                sectionHeader.label.text = Date().nextMonth
//            case 2:
//                sectionHeader.label.text = Date().afterNextMonth
//            default:
//                sectionHeader.label.text = ""
//            }
//            
//             return sectionHeader
//        } else { //No footer in this case but can add option for that
//             return UICollectionReusableView()
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 40)
    }
}

extension CalendarVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return days?.first ?? 0
        case 1:
            return days?[1] ?? 0
        case 2:
            return days?.last ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var nextMonth: String {
//        let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var afterNextMonth: String {
//        let nextMonth = Calendar.current.date(byAdding: .month, value: 2, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
}
