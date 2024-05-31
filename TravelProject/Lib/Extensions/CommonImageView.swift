//
//  CommonImageView.swift
//  TravelProject
//
//  Created by 강한결 on 5/27/24.
//

import UIKit

extension UIImageView {
    
    func commonSquareImage(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.contentMode = .scaleAspectFill
    }
}
