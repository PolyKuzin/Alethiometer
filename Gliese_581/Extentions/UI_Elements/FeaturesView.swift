//
//  FeaturesView.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.12.2020.
//

import UIKit

extension UIView {
    
    func setFeaturesView(on view: UIView, with image: UIImage, title: String, subtitle: String) {
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 80)
        backgroundColor = UIColor(red: 0.239, green: 0.235, blue: 0.267, alpha: 1)
        layer.cornerRadius = 20
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            self.heightAnchor.constraint(equalToConstant: 80),
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        let imageView = UIImageView(image: image)
        let tit = UILabel()
        tit.text = title
        let sub = UILabel()
        sub.text = subtitle
        
        tit.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        tit.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        sub.textColor = UIColor(red: 0.613, green: 0.613, blue: 0.613, alpha: 1)
        sub.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        
        self.addSubview(imageView)
        self.addSubview(tit)
        self.addSubview(sub)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        tit.translatesAutoresizingMaskIntoConstraints = false
        sub.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 23),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            imageView.widthAnchor.constraint(equalToConstant: self.frame.height - 47),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            
            tit.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            tit.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            tit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            sub.topAnchor.constraint(equalTo: tit.bottomAnchor, constant: 2),
            sub.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            sub.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}
