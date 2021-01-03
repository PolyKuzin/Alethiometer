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
    @IBOutlet weak var heartView      : CircularProgressView!
    @IBOutlet weak var heartImage     : UIImageView!
    @IBOutlet weak var careerView     : CircularProgressView!
    @IBOutlet weak var careerImage    : UIImageView!
    @IBOutlet weak var familyView     : CircularProgressView!
    @IBOutlet weak var familyImage    : UIImageView!
    @IBOutlet weak var healthView     : CircularProgressView!
    @IBOutlet weak var healthImage    : UIImageView!
    @IBOutlet weak var heartLabel     : UILabel!
    @IBOutlet weak var careerLabel    : UILabel!
    @IBOutlet weak var familyLabel    : UILabel!
    @IBOutlet weak var healthLabel    : UILabel!
    
    public var viewState : MenuController.ViewState.Focus = .initial {
        didSet {
            self.leftImageView.image = viewState.image
            self.titleLabel.text = viewState.title
            self.familyLabel.text = "Family"
            self.careerLabel.text = "Career"
            self.healthLabel.text = "Health"
            self.heartLabel.text = "Relations"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        
        heartImage.image = UIImage(named: "Relate")
        careerImage.image = UIImage(named: "Relate")
        familyImage.image = UIImage(named: "Relate")
        healthImage.image = UIImage(named: "Health")
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
        
        animateView(heartView)
        animateView(careerView)
        animateView(familyView)
        animateView(healthView)
    }
    
    func animateView(_ view: CircularProgressView) {
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        switch view {
        case healthView:
            view.configure(with: UIColor(red: 0.992, green: 1, blue: 0.587, alpha: 1), heartAngle)
        case careerView:
            view.configure(with: UIColor(red: 0.729, green: 0.631, blue: 1, alpha: 1), careerAngle)
        case familyView:
            view.configure(with: UIColor(red: 0.62, green: 1, blue: 0.587, alpha: 1), familyAngle)
        case heartView:
            view.configure(with: UIColor(red: 0.976, green: 0.443, blue: 0.667, alpha: 1), healthAngle)
        default:
            break
        }
        view.createCircularPath()
        view.progressAnimation(duration: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
