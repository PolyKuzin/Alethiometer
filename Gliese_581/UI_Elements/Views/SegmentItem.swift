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
        label.font           = UIFont(name: "MoscowSans-Bold", size: 13)
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
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(mainLabel)
        NSLayoutConstraint.activate([
            mainLabel.heightAnchor      .constraint(equalToConstant: 22),
            mainLabel.trailingAnchor    .constraint(equalTo: trailingAnchor, constant: -16 ),
            mainLabel.leadingAnchor     .constraint(equalTo: leadingAnchor,  constant: 16 ),
            mainLabel.centerYAnchor     .constraint(equalTo: centerYAnchor)
//            mainLabel.topAnchor         .constraint(equalTo: topAnchor, constant: 13),
//            mainLabel.bottomAnchor      .constraint(equalTo: bottomAnchor, constant: -13)
        ])
    }
}
