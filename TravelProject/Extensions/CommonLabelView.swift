//
//  CommonLabelView.swift
//  TravelProject
//
//  Created by 강한결 on 5/27/24.
//

import UIKit

extension UILabel {
    
    func titleLabelStyle() {
        self.font = .boldSystemFont(ofSize: 20)
        self.numberOfLines = 0
    }
    
    func descriptLabelStyle(size: CGFloat, color: UIColor) {
        self.font = .systemFont(ofSize: size)
        self.textColor = color
        self.numberOfLines = 0
    }
}
