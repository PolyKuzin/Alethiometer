//
//  HomeVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 15.12.2020.
//

import UIKit

class HomeVC: BaseVC {
    
    var isExpand = false
    
    @IBOutlet weak var profileButton   : UIButton!
    @IBOutlet weak var zodiacImageView : UIImageView!
    @IBOutlet weak var zodiacNameLabel : UILabel!
    @IBOutlet weak var dateLabel       : UILabel!
    @IBOutlet weak var starsImageView  : UIImageView!
    @IBOutlet weak var expandButton   : UIButton!

    @IBOutlet weak var elementView     : UIView!
    @IBOutlet weak var colorView       : UIView!
    @IBOutlet weak var planetView      : UIView!
    @IBOutlet weak var luckyDaysView   : UIView!
    
    @IBOutlet weak var collectionView  : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.elementView.alpha = 0
        self.colorView.alpha = 0
        self.planetView.alpha = 0
        self.luckyDaysView.alpha = 0

        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        collectionView.contentInset = UIEdgeInsets(top: 210, left: 0, bottom: 0, right: 0)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceVertical = false
        collectionView.alwaysBounceHorizontal = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: MainCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: MainCollectionViewCell.reuseID)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
    }
    
    @objc
    func handleTap(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: self.view)
        let isPointInFrame = expandButton.frame.contains(touchPoint)
        if isPointInFrame == true {
            handleExpand()
        }
    }
    
    func handleExpand() {
        if isExpand {
            UIView.animate(withDuration: 0.2) {
                self.collectionView.contentInset = UIEdgeInsets(top: 210, left: 0, bottom: 0, right: 0)
                self.elementView.alpha = 0
                self.colorView.alpha = 0
                self.planetView.alpha = 0
                self.luckyDaysView.alpha = 0
                self.isExpand = false
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.collectionView.contentInset = UIEdgeInsets(top: 450, left: 0, bottom: 0, right: 0)
                self.elementView.alpha = 1
                self.colorView.alpha = 1
                self.planetView.alpha = 1
                self.luckyDaysView.alpha = 1
                self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
                self.isExpand = true
            }
        }
    }
}

extension HomeVC : UICollectionViewDelegate {
}

extension HomeVC : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.reuseID, for: indexPath) as! MainCollectionViewCell
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 40)
    }
}
