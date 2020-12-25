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
        let onSelect  : [(()->())]
        
        static let initial = ViewState(upColor: .clear, downColor: .clear, image: UIImage(), title: "", isLocked: true, onSelect: [{ }])
    }

    public var viewState : ViewState = .initial {
        didSet {
            self.lockedView.roundCorners(.all, radius: 20)
            self.lockedView.frame = CGRect(x: 0, y: 0, width: self.frame.width + 10, height: self.frame.height)
            self.containerView.frame = CGRect(x: 0, y: 0, width: self.frame.width + 10, height: self.frame.height)
            self.containerView.roundCorners(.all, radius: 20)
            self.containerView.setGradientBackground(upColor: viewState.upColor, downColor: viewState.downColor)
            self.iconImageView.image = viewState.image
            self.label.text = viewState.title
            if viewState.isLocked {
                self.lockedView.backgroundColor = UIColor.black
                self.lockedView.alpha = 0.3
            } else {
                self.lockedView.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear

    }
}
