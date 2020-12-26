//
//  CenteredButton.swift
//  Gliese_581
//
//  Created by Павел Кузин on 25.12.2020.
//

import UIKit

@IBDesignable class MKCenteredButtonViewWrapper : NibWrapperView<CenteredButton> { }

class CenteredButton : UIView {

    var onSelect     : (() -> ())?
    
    var isEnabled    : Bool = false {
        didSet {
            if !isEnabled {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
                view.backgroundColor = .black
                view.alpha = 0.3
                let imageView = UIImageView(image: UIImage(named: "Relate"))
                view.addSubview(imageView)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: 15),
                    imageView.widthAnchor.constraint(equalToConstant: 15),
                    imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
                    imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12)
                ])
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    view.topAnchor.constraint(equalTo: topAnchor),
                    view.trailingAnchor.constraint(equalTo: trailingAnchor),
                    view.leadingAnchor.constraint(equalTo: leadingAnchor),
                    view.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
            }
        }
    }
    
    @IBOutlet weak var iconImageView : UIImageView!
    @IBOutlet weak var titleLabel    : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setGradient(_ upColor: UIColor, _ downColor: UIColor) {
        setGradientBackground(upColor: upColor, downColor: downColor)
    }
}

extension CenteredButton {
    private func setup() {
        self.roundCorners(.all, radius: 20)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handle(tap:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func handle(tap: UITapGestureRecognizer) {
        onSelect?()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 1.0
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 0.5
            }, completion: nil)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 1.0
            }, completion: nil)
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.alpha = 0.5
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = 1.0
            }, completion: nil)
        }
    }
}
