//
//  CalendarCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit

class CalendarCell: UITableViewCell, BaseTableViewCell {
    
    static var reuseID = "CalendarCell"
    
    @IBOutlet weak var leftImageView   : UIImageView!
    @IBOutlet weak var titleLabel      : UILabel!
    @IBOutlet weak var containerView   : UIView!
    
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view0: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view1: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view2: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view3: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view4: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view5: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view6: UIView!
    @NibWrapped(CenteredButton.self)
    @IBOutlet var view7: UIView!
    
    var items : [ViewState] = []
    
    struct ViewState {
        let upColor   : UIColor
        let downColor : UIColor
        let image     : UIImage
        let title     : String
        let isLocked  : Bool
        let onSelect  : [(()->())]
        
        static let initial = ViewState(upColor: .clear, downColor: .clear, image: UIImage(), title: "", isLocked: true, onSelect: [{ }])
    }
    
    public var viewState : MenuController.ViewState.Calendar = .initial {
        didSet {
            self.items = viewState.items
            self.leftImageView.image = viewState.image
            self.titleLabel.text = viewState.title
            for i in 0...items.count {
                switch i {
                case 0:
                    view0.backgroundColor = .clear
                    _view0.iconImageView?.image = items[i].image
                    _view0.titleLabel?.textColor = .black
                    _view0.titleLabel?.text = items[i].title
                    _view0.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view0.isEnabled = false
                        _view0.onSelect = items[i].onSelect.first
                    } else {
                        _view0.onSelect = items[i].onSelect.last
                    }
                case 1:
                    view1.backgroundColor = .clear
                    _view1.iconImageView?.image = items[i].image
                    _view1.titleLabel?.textColor = .black
                    _view1.titleLabel?.text = items[i].title
                    _view1.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view1.isEnabled = false
                        _view1.onSelect = items[i].onSelect.first
                    } else {
                        _view1.onSelect = items[i].onSelect.last
                    }
                case 2:
                    view2.backgroundColor = .clear
                    _view2.iconImageView?.image = items[i].image
                    _view2.titleLabel?.textColor = .black
                    _view2.titleLabel?.text = items[i].title
                    _view2.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view2.isEnabled = false
                        _view2.onSelect = items[i].onSelect.first
                    } else {
                        _view2.onSelect = items[i].onSelect.last
                    }
                case 3:
                    view3.backgroundColor = .clear
                    _view3.iconImageView?.image = items[i].image
                    _view3.titleLabel?.textColor = .black
                    _view3.titleLabel?.text = items[i].title
                    _view3.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view3.isEnabled = false
                        _view3.onSelect = items[i].onSelect.first
                    } else {
                        _view3.onSelect = items[i].onSelect.last
                    }
                case 4:
                    view4.backgroundColor = .clear
                    _view4.iconImageView?.image = items[i].image
                    _view4.titleLabel?.textColor = .black
                    _view4.titleLabel?.text = items[i].title
                    _view4.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view4.isEnabled = false
                        _view4.onSelect = items[i].onSelect.first
                    } else {
                        _view4.onSelect = items[i].onSelect.last
                    }
                case 5:
                    view5.backgroundColor = .clear
                    _view5.iconImageView?.image = items[i].image
                    _view5.titleLabel?.textColor = .black
                    _view5.titleLabel?.text = items[i].title
                    _view5.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view5.isEnabled = false
                        _view5.onSelect = items[i].onSelect.first
                    } else {
                        _view5.onSelect = items[i].onSelect.last
                    }
                case 6:
                    view6.backgroundColor = .clear
                    _view6.iconImageView?.image = items[i].image
                    _view6.titleLabel?.textColor = .black
                    _view6.titleLabel?.text = items[i].title
                    _view6.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view6.isEnabled = false
                        _view6.onSelect = items[i].onSelect.first
                    } else {
                        _view6.onSelect = items[i].onSelect.last
                    }
                case 7:
                    view7.backgroundColor = .clear
                    _view7.iconImageView?.image = items[i].image
                    _view7.titleLabel?.textColor = .black
                    _view7.titleLabel?.text = items[i].title
                    _view7.unwrapped.setGradientBackground(upColor: items[i].upColor, downColor: items[i].downColor)
                    if items[i].isLocked {
                        _view7.isEnabled = false
                        _view7.onSelect = items[i].onSelect.first
                    } else {
                        _view7.onSelect = items[i].onSelect.last
                    }
                default:
                    break
                }
            }
            print(items.count)
        }
    }
    
    @objc
    func handleLocked() {
        items[0].onSelect[0]()
    }
    
    @objc
    func handleUNLocked(sender: UIButton) {
        for i in 0...items.count - 1 {
            if i == sender.tag {
                items[i].onSelect[1]()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        containerView.roundCorners(.all, radius: 20)
        self.containerView.backgroundColor = UIColor(red: 0.238, green: 0.237, blue: 0.267, alpha: 1)
        
        layer.borderWidth             = 0.0
        layer.shadowColor             = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        layer.shadowOffset            = CGSize(width: 0, height: 0)
        layer.shadowRadius            = 8
        layer.shadowOpacity           = 1
        layer.masksToBounds           = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CalendarCell {
    
    func handleButtons(_: [UIButton]) {
        
    }
}

//extension CalendarCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width / 2.25, height: 120)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 16
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
//}
//
//extension CalendarCell : UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let data = items[indexPath.row]
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarItemCollectionCell.reuseID, for: indexPath) as! CalendarItemCollectionCell
//        cell.viewState = data
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let data = items[indexPath.row]
//        if data.isLocked {
//            guard let onSelect = data.onSelect.first else { return }
//            onSelect()
//        } else {
//            guard let onSelect = data.onSelect.last else { return }
//            onSelect()
//        }
//    }
//}
