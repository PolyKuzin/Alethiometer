//
//  NumberCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 02.01.2021.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    static let reuseID = "NumberCell"
    
    @IBOutlet weak var numberLabel   : UILabel!
    @IBOutlet weak var containerView : UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.isHidden = true
        containerView.backgroundColor = UIColor.main
        containerView.roundCorners(.all, radius: containerView.frame.height / 2)
        numberLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        layoutIfNeeded()
    }

    func setCircled() {
        containerView.isHidden = false
        numberLabel.textColor = UIColor.black
        layoutIfNeeded()
    }
}
