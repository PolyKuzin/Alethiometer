//
//  FloatinLayout.swift
//  Gliese_581
//
//  Created by Павел Кузин on 22.12.2020.
//

import UIKit
import FloatingPanel

class MenuFloatingLayout: FloatingPanelLayout {
    
    var initialState: FloatingPanelState    = .half
    var position    : FloatingPanelPosition = .bottom
    
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        switch UIDevice.modelName {
        case "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6s", "iPhone 7", "iPhone SE", "iPhone 8", "iPod touch (6th generation)", "iPod touch (7th generation)":
            return [
                .full: FloatingPanelLayoutAnchor(absoluteInset: 16,     edge: .top,    referenceGuide: .safeArea ),
                .half: FloatingPanelLayoutAnchor(fractionalInset: 0.7, edge: .bottom, referenceGuide: .superview),
                .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .superview)
            ]
        default:
            return [
                .full: FloatingPanelLayoutAnchor(absoluteInset: 16,     edge: .top,    referenceGuide: .safeArea ),
                .half: FloatingPanelLayoutAnchor(fractionalInset: 0.7, edge: .bottom, referenceGuide: .superview),
                .tip: FloatingPanelLayoutAnchor(fractionalInset: 0.4, edge: .bottom, referenceGuide: .superview)
            ]
        }
    }
}
