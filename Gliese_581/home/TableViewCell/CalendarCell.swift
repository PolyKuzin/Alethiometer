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
            collectionView.reloadData()
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        collectionView.frame = CGRect(x: 0, y: 0, width: 335, height: 424)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.72, height: 95)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        
        collectionView.register(UINib(nibName: "CalendarItemCollectionCell", bundle: nil), forCellWithReuseIdentifier: CalendarItemCollectionCell.reuseID)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension CalendarCell : UICollectionViewDelegate { }

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
}
