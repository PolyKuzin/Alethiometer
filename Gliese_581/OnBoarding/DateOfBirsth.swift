//
//  DateOfBirsth.swift
//  Gliese_581
//
//  Created by Павел Кузин on 23.11.2020.
//

import UIKit

class DateOfBirsth: BaseVC {
    
    let label = UILabel()

    var nextButton = UIButton()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.setTitleLabel(on: view)
        label.text = "Your date of birth"
        
        
        nextButton.setNextButton(on: view)
        nextButton.addTarget(self, action: #selector(goToDateOfBirthVC), for: .touchUpInside)

    }
    
    @objc
    private func goToDateOfBirthVC() {
        let vc = TimeOfBirsthVC()
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(vc, animated: true)
        self.dismiss(animated: true, completion: nil)

    }
}
