//
//  ScrollVC.swift
//  Gliese_581
//
//  Created by Павел Кузин on 09.01.2021.
//

import UIKit

var selectedPage = 0 

class ScrollVC : BaseVC {
    
    var onSegmentSelect : (()->())?
    
    private let scrollView : UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: 3 * UIScreen.main.bounds.width, height: 0))
        scroll.backgroundColor = .purple
        scroll.isPagingEnabled = true
        scroll.alwaysBounceVertical = false
        scroll.alwaysBounceHorizontal = false
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        DispatchQueue.main.async {
            let pageWidth = self.view.frame.size.width
            let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
            selectedPage = currentPage
        }
    }
}
