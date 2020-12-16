//
//  FocusCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 16.12.2020.
//

import UIKit

class FocusCell: UITableViewCell, BaseTableViewCell {
    
    static var reuseID = "FocusCell"

    @IBOutlet weak var containerView  : UIView!
    @IBOutlet weak var leftImageView  : UIImageView!
    @IBOutlet weak var titleLabel     : UILabel!
    @IBOutlet weak var heartView      : UIView!
    @IBOutlet weak var careerView     : UIView!
    @IBOutlet weak var familyView     : UIView!
    @IBOutlet weak var healthView     : UIView!
    @IBOutlet weak var heartLabel     : UILabel!
    @IBOutlet weak var careerLabel    : UILabel!
    @IBOutlet weak var familyLabel    : UILabel!
    @IBOutlet weak var healthLabel    : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        containerView.roundCorners(.all, radius: 20)
        self.containerView.backgroundColor = UIColor(red: 0.238, green: 0.237, blue: 0.267, alpha: 1)
        heartView.roundCorners(.all, radius: 33)
        careerView.roundCorners(.all, radius: 33)
        familyView.roundCorners(.all, radius: 33)
        healthView.roundCorners(.all, radius: 33)
        heartLabel.text = "Relations"
        careerLabel.text = "Career"
        familyLabel.text = "Family"
        healthLabel.text = "Health"
        
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
