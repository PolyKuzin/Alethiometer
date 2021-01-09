//
//  Title.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.01.2021.
//

import UIKit

class TitleCell: UITableViewCell {
    
    static let reuseID = "TitleCell"
    
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    struct ViewState {
        var image    : UIImage
        var title    : String
        var subTitle : String
        
        static let initial = ViewState(image: UIImage(), title: "", subTitle: "")
    }
    
    public var viewState : ViewState = .initial {
        didSet {
            self.title.text = viewState.title
            self.subTitle.text = viewState.subTitle
            guard let image = UIImage(named: viewState.title) else { return }
            activityImage.image = image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
