//
//  SegmentControl.swift
//  Gliese_581
//
//  Created by Павел Кузин on 24.12.2020.
//

import UIKit

struct Item {
    let icon       : UIImage
    let title      : String
    var isSelected : Bool
}

class ScrollableSegmentControl: UIView {
        
    var openPayWall     : (() -> ())?
    var onSegmentSelect : ((Int) -> ())?
    
    override var intrinsicContentSize: CGSize {
      return UIView.layoutFittingExpandedSize
    }
    
    private let collectionView: UICollectionView = {
        let flowLayout                           = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize             = CGSize(width: 130, height: 30)
        flowLayout.minimumInteritemSpacing       = 10
        flowLayout.scrollDirection               = .horizontal
        flowLayout.sectionInset                  = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30), collectionViewLayout: flowLayout)
        cv.showsHorizontalScrollIndicator        = false
        cv.showsVerticalScrollIndicator          = false
        cv.backgroundColor                       = .clear
        cv.isScrollEnabled                       = true
        cv.register(ScrollableCollectionViewCELL.self, forCellWithReuseIdentifier: ScrollableCollectionViewCELL().reuseID)
        return cv
    }()
    
    public var items = [Item]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        collectionView.delegate   = self
        collectionView.dataSource = self
        collectionView.pin(on: self, {
            [
                $0.topAnchor    .constraint(equalTo: $1.topAnchor,    constant: 0),
                $0.leftAnchor   .constraint(equalTo: $1.leftAnchor,   constant: 0),
                $0.rightAnchor  .constraint(equalTo: $1.rightAnchor,  constant: 0),
                $0.bottomAnchor .constraint(equalTo: $1.bottomAnchor, constant: 0),
            ]
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScrollableSegmentControl {
    
    public func insertSegment(_ item : Item, index: Int) {
        items.insert(item, at: index)
    }
    
    public func setSelected(at index: Int) {
        if items[safe: index] != nil {
            switch index {
            case 0:
                UIView.animate(withDuration: 0.2, animations: {
                    self.items.enumerated().forEach { (_index,_) in self.items[_index].isSelected = false }
//                    self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: false)
                })
                self.items[index].isSelected = true
            case 1:
                UIView.animate(withDuration: 0.2, animations: {
                    self.items.enumerated().forEach { (_index,_) in self.items[_index].isSelected = false }
//                    self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: false)
                })
                self.items[index].isSelected = true
            case 2:
                UIView.animate(withDuration: 0.2, animations: {
                    self.items.enumerated().forEach { (_index,_) in self.items[_index].isSelected = false }
//                    self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: false)
                })
                self.items[index].isSelected = true
            case 3:
                UIView.animate(withDuration: 0.2, animations: {
                    self.items.enumerated().forEach { (_index,_) in self.items[_index].isSelected = false }
//                    self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: false)
                })
                self.items[index].isSelected = true
            default:
                break
            }
        }
    }
}

extension ScrollableSegmentControl: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollableCollectionViewCELL().reuseID, for: indexPath) as! ScrollableCollectionViewCELL
        cell.mainLabel.text = items[indexPath.row].title
        cell.mainIcon.image    = items[indexPath.row].icon
        if indexPath.row == 0 {
            cell.setupNormalLayout()
        } else {
            cell.setupLayout()
        }
        if items[indexPath.row].isSelected {
            cell.backgroundColor        = UIColor.main
            cell.mainLabel.textColor    = .black
            cell.mainIcon.setImageColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
        } else {
            cell.backgroundColor        = .clear
            cell.mainLabel.textColor    = UIColor.white
            cell.mainIcon.setImageColor(UIColor(red: 1, green: 1, blue: 1, alpha: 0.3))
        }
        return cell
    }
    
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 30)
    }
}

extension ScrollableSegmentControl: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onSegmentSelect?(indexPath.row)
    }
}
