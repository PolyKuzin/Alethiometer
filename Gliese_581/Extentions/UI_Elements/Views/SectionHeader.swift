//
//  SectionHeader.swift
//  Gliese_581
//
//  Created by Павел Кузин on 26.12.2020.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
     var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .white
         label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
         label.sizeToFit()
         return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)

         label.translatesAutoresizingMaskIntoConstraints = false
         label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
         label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
         label.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
