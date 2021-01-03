//
//  MounthCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 02.01.2021.
//

import UIKit

class MounthCell: UITableViewCell {
    
    static let reuseID = "MounthCell"
    
    @IBOutlet weak var monthLabel     : UILabel!
    @IBOutlet weak var collectionView : UICollectionView!
    
    var items = 0
    
    struct ViewState {
        var name : String
        var days : Int
        var circled : [Int]
        
        static let initial = ViewState(name: "", days: 0, circled: [])
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            monthLabel.text = viewState.name
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: NumberCell.reuseID, bundle: nil), forCellWithReuseIdentifier: NumberCell.reuseID)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 31, height: 31)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        collectionView!.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.background
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension MounthCell : UICollectionViewDelegate {
    
}

extension MounthCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewState.days
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCell.reuseID, for: indexPath) as! NumberCell
//        if indexPath.row == viewState.circled[indexPath.row] {
//           cell.setCircled()
//        }
        if viewState.circled.count > 0 {
            for i in 0...viewState.circled.count - 1 {
                if viewState.circled[i] == indexPath.row + 1 {
                    cell.setCircled()
                }
            }
        }
        items += 1
        cell.numberLabel.text = "\(items)"
        return cell
    }
}
