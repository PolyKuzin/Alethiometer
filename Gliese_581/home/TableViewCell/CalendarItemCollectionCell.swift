//
//  CalendarItemCollectionCell.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit

class CalendarItemCollectionCell: UICollectionViewCell {
    
    static let reuseID = "CalendarItemCollectionCell"
    
    @IBOutlet weak var containerView : UIView!
    @IBOutlet weak var iconImageView : UIImageView!
    @IBOutlet weak var label         : UILabel!
    @IBOutlet weak var lockedView    : UIView!
    
    struct ViewState {
        let upColor   : UIColor
        let downColor : UIColor
        let image     : UIImage
        let title     : String
        let isLocked  : Bool
        
        static let initial = ViewState(upColor: .clear, downColor: .clear, image: UIImage(), title: "", isLocked: true)
    }

    public var viewState : ViewState = .initial {
        didSet {
            self.containerView.setGradientBackground(upColor: viewState.upColor, downColor: viewState.downColor)
            self.iconImageView.image = viewState.image
            self.label.text = viewState.title
//            if viewState.isLocked {
//                self.lockedView.backgroundColor = UIColor.black
//                self.lockedView.alpha = 0.1
//            } else {
//                self.lockedView.isHidden = true
//            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        containerView.frame = CGRect(x: 0, y: 0, width: 145, height: 95)
//        lockedView.frame = CGRect(x: 0, y: 0, width: 145, height: 95)
    }
}
