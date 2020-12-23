//
//  CalendarCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit

class CalendarCell: UITableViewCell, BaseTableViewCell {
    
    static var reuseID = "CalendarCell"
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    
    var items : [CalendarItemCollectionCell.ViewState] = []
    
    public var viewState : MenuController.ViewState.Calendar = .initial {
        didSet {
            self.leftImageView.image = viewState.image
            self.titleLabel.text = viewState.title
            self.items = viewState.items
            collectionView.frame = CGRect(x: 0, y: 0, width: 145*2 + 40, height: 95*4)
//            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: <#T##UICollectionView.ScrollPosition#>, animated: <#T##Bool#>)
            print(items.count)
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(UINib(nibName: "CalendarItemCollectionCell", bundle: nil), forCellWithReuseIdentifier: CalendarItemCollectionCell.reuseID)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension CalendarCell : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.25, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

extension CalendarCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarItemCollectionCell.reuseID, for: indexPath) as! CalendarItemCollectionCell
        cell.viewState = data
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = items[indexPath.row]
        if data.isLocked {
            guard let onSelect = data.onSelect.first else { return }
            onSelect()
        } else {
            guard let onSelect = data.onSelect.last else { return }
            onSelect()
        }
    }
}
