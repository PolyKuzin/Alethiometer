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
    @IBOutlet var categoryButtons: [UIButton]!
    
    
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
            for i in 0...categoryButtons.count - 1 {
//                let imageView = UIImageView(image: UIImage(named: "Relate"))
//                let layer = C
//                categoryButtons[i].layer.addSublayer(<#T##layer: CALayer##CALayer#>)(imageView)
//                NSLayoutConstraint.activate([
//                    imageView.widthAnchor.constraint(equalToConstant: 45),
//                    imageView.heightAnchor.constraint(equalToConstant: 45),
//                    imageView.topAnchor.constraint(equalTo: categoryButtons[i].topAnchor, constant: 12),
//                    imageView.centerXAnchor.constraint(equalTo: categoryButtons[i].centerXAnchor)
//                ])
                categoryButtons[safe: i]?.tag = i
                categoryButtons[safe: i]?.setTitleColor(.black, for: .normal)
                categoryButtons[safe: i]?.setTitle(items[i].title, for: .normal)
                categoryButtons[safe: i]?.roundCorners(.all, radius: 20)
                categoryButtons[safe: i]?.setGradientBackground(upColor: viewState.items[i].upColor, downColor: viewState.items[i].downColor)
                if items[i].isLocked {
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: categoryButtons[i].frame.width, height: categoryButtons[i].frame.height))
                    view.backgroundColor = .black
                    view.alpha = 0.3
                    let imageView = UIImageView(image: UIImage(named: "Relate"))
                    view.addSubview(imageView)
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        imageView.heightAnchor.constraint(equalToConstant: 15),
                        imageView.widthAnchor.constraint(equalToConstant: 15),
                        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
                        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
                    ])
                    let tap = UITapGestureRecognizer(target: self, action: #selector(handleLocked))
                    tap.numberOfTapsRequired = 1
                    view.addGestureRecognizer(tap)
                    categoryButtons[i].addSubview(view)
                } else {
                    categoryButtons[i].addTarget(self, action: #selector(handleUNLocked(sender:)), for: .touchUpInside)
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
