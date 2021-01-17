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
    
    struct ViewState {
        var image : UIImage
        var title : String
        let onHeartTap  : (()->())
        let onCareerTap : (()->())
        let onFamilyTap : (()->())
        let onHealthTap : (()->())
        
        static let initial = ViewState(image: UIImage(), title: "", onHeartTap: {}, onCareerTap: {}, onFamilyTap: {}, onHealthTap: {})
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            self.leftImageView.image = viewState.image
            self.titleLabel.text = viewState.title
            self.familyLabel.text = "Family"
            self.careerLabel.text = "Career"
            self.healthLabel.text = "Health"
            self.heartLabel.text = "Relations"
            animateView(heartView)
            animateView(careerView)
            animateView(familyView)
            animateView(healthView)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        
        containerView.roundCorners(.all, radius: 20)
        self.containerView.backgroundColor = UIColor(red: 0.238, green: 0.237, blue: 0.267, alpha: 1)
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
    
    func animateView(_ view: CircularProgressView) {
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        switch view {
        case healthView:
            switch titleLabel.text  {
            case "Focus today".localized()    : view.configure(with: UIColor(red: 0.992, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "todayHeartAngle") as! CGFloat)
            case "Focus tomorrow".localized() : view.configure(with: UIColor(red: 0.992, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "tomorrowHeartAngle") as! CGFloat)
            case "Week focus".localized()     : view.configure(with: UIColor(red: 0.992, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "weekHeartAngle") as! CGFloat)
            case "Month focus".localized()    : view.configure(with: UIColor(red: 0.992, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "monthHeartAngle") as! CGFloat)
            default: break
            }
        case careerView:
            switch titleLabel.text {
            case "Focus today".localized()    : view.configure(with: UIColor(red: 0.729, green: 0.631, blue: 1, alpha: 1), UserDefaults.standard.value(forKey: "todayCareerAngle") as! CGFloat)
            case "Focus tomorrow".localized() : view.configure(with: UIColor(red: 0.729, green: 0.631, blue: 1, alpha: 1), UserDefaults.standard.value(forKey: "tomorrowCareerAngle") as! CGFloat)
            case "Week focus".localized()     : view.configure(with: UIColor(red: 0.729, green: 0.631, blue: 1, alpha: 1), UserDefaults.standard.value(forKey: "weekCareerAngle") as! CGFloat)
            case "Month focus".localized()    : view.configure(with: UIColor(red: 0.729, green: 0.631, blue: 1, alpha: 1), UserDefaults.standard.value(forKey: "monthCareerAngle") as! CGFloat)
            default: break
            }
        case familyView:
            switch titleLabel.text {
            case "Focus today".localized()    : view.configure(with: UIColor(red: 0.62, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "todayFamilyAngle") as! CGFloat)
            case "Focus tomorrow".localized() : view.configure(with: UIColor(red: 0.62, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "tomorrowFamilyAngle") as! CGFloat)
            case "Week focus".localized()     : view.configure(with: UIColor(red: 0.62, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "weekFamilyAngle") as! CGFloat)
            case "Month focus".localized()    : view.configure(with: UIColor(red: 0.62, green: 1, blue: 0.587, alpha: 1), UserDefaults.standard.value(forKey: "monthFamilyAngle") as! CGFloat)
            default: break
            }
        case heartView:
            switch titleLabel.text {
            case "Focus today"    : view.configure(with: UIColor(red: 0.976, green: 0.443, blue: 0.667, alpha: 1), UserDefaults.standard.value(forKey: "todayHealthAngle") as! CGFloat)
            case "Focus tomorrow" : view.configure(with: UIColor(red: 0.976, green: 0.443, blue: 0.667, alpha: 1), UserDefaults.standard.value(forKey: "tomorrowHealthAngle") as! CGFloat)
            case "Week focus"     : view.configure(with: UIColor(red: 0.976, green: 0.443, blue: 0.667, alpha: 1), UserDefaults.standard.value(forKey: "weekHealthAngle") as! CGFloat)
            case "Month focus"    : view.configure(with: UIColor(red: 0.976, green: 0.443, blue: 0.667, alpha: 1), UserDefaults.standard.value(forKey: "monthHealthAngle") as! CGFloat)
            default: break
            }
        default:
            break
        }
        view.roundCorners(.all, radius: 33)
        view.createCircularPath()
        view.progressAnimation(duration: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
