//
//  Appearence.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit
import FloatingPanel

extension FloatingPanelController {
    
    static func appereance() -> SurfaceAppearance {
        let appearance = SurfaceAppearance()
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: 16)
        shadow.radius = 16
        shadow.spread = 8
        appearance.shadows = [shadow]
        appearance.cornerRadius = 16.0
        appearance.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.234, alpha: 1)
        return appearance
    }
}
