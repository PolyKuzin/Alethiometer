//
//  SegmentItem.swift
//  Gliese_581
//
//  Created by Павел Кузин on 24.12.2020.
//

import UIKit

class ScrollableCollectionViewCELL : UICollectionViewCell {
    
    let reuseID = "ScrollableCollectionViewCELL"
    
    var mainLabel            : UILabel = {
        let label            = UILabel()
        label.textAlignment  = .left
        label.font           = UIFont(name: "SFProDisplay-Semibold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var mainIcon             : UIImageView = {
        let imageView        = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius   = frame.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor      .constraint(equalToConstant: 22),
            mainLabel.trailingAnchor    .constraint(equalTo: trailingAnchor, constant: -16 ),
            mainLabel.centerYAnchor     .constraint(equalTo: centerYAnchor)
        ])
        if !UserDefaults.standard.bool(forKey: "setProVersion") {
            addSubview(mainIcon)
            mainIcon.setImageColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
            mainIcon.leadingAnchor  .constraint(equalTo: leadingAnchor, constant: 10).isActive = true
            mainIcon.heightAnchor   .constraint(equalToConstant: 15).isActive     = true
            mainIcon.widthAnchor    .constraint(equalToConstant: 13).isActive      = true
            mainIcon.centerYAnchor  .constraint(equalTo: centerYAnchor).isActive = true
            mainIcon.trailingAnchor .constraint(equalTo: mainLabel.leadingAnchor, constant: -5).isActive = true
        } else {
            mainLabel.leadingAnchor  .constraint(equalTo: leadingAnchor,  constant: 16 ).isActive = true
        }
    }
    
    func setupNormalLayout() {
        addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor      .constraint(equalToConstant: 22),
            mainLabel.trailingAnchor    .constraint(equalTo: trailingAnchor, constant: -16 ),
            mainLabel.centerYAnchor     .constraint(equalTo: centerYAnchor)
        ])
        mainLabel.leadingAnchor  .constraint(equalTo: leadingAnchor,  constant: 16 ).isActive = true
    }
}
