//
//  InstanceHoroscopeCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 16.12.2020.
//

import UIKit

class InstanceHoroscopeCell: UITableViewCell, BaseTableViewCell {
    
    static var reuseID = "InstanceHoroscopeCell"
    
    
    public var viewState : MenuController.ViewState.Instant = .initial {
        didSet {
            self.leftImageView.image = viewState.image
            self.titleLabel.text = viewState.title
            self.bodyLabel.text = viewState.body
        }
    }

    var isExpand = false
    
    @IBOutlet weak var containerView  : UIView!
    @IBOutlet weak var leftImageView  : UIImageView!
    @IBOutlet weak var rightImageView : UIImageView!
    @IBOutlet weak var titleLabel     : UILabel!
    @IBOutlet weak var bodyLabel      : UILabel!
    @IBOutlet weak var moreButton     : UIButton!
    
    @IBAction func handleMore() {
        if isExpand {
            isExpand = false
            setNeedsLayout()
            UIView.animate(withDuration: 0.2) {
                self.bodyLabel.numberOfLines = 5
                self.viewState.onTap()
            }
            self.layoutIfNeeded()
        } else {
            isExpand = true
            setNeedsLayout()
            UIView.animate(withDuration: 0.2) {
                self.bodyLabel.numberOfLines = 0
                self.viewState.onTap()
            }
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        containerView.roundCorners(.all, radius: 20)
        self.containerView.backgroundColor = UIColor(red: 0.238, green: 0.237, blue: 0.267, alpha: 1)
        moreButton.roundCorners(.all, radius: 14)
        moreButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
