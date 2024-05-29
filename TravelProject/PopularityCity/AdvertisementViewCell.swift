//
//  AdvertisementViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/27/24.
//

import UIKit

class AdvertisementViewCell: UITableViewCell {
    
    let backgroundColorList: [UIColor] = [.gray, .green.withAlphaComponent(0.5), .orange.withAlphaComponent(0.5), .blue.withAlphaComponent(0.5), .systemGreen.withAlphaComponent(0.5)]

    @IBOutlet var totalBackgroundView: UIView!
    @IBOutlet var adBackgroundView: UIView!
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        totalBackgroundView.backgroundColor = self.configureBackgroundColor()
        totalBackgroundView.layer.cornerRadius = 4
        adBackgroundView.backgroundColor = .systemGreen
        adBackgroundView.layer.cornerRadius = 2
        adLabel.textAlignment = .center
        adLabel.font = .systemFont(ofSize: 15)
        adLabel.numberOfLines = 0
    }

    func configureCell(_ data: City) {
        self.adLabel.text = data.title
    }
    
    func configureBackgroundColor() -> UIColor {
        return backgroundColorList[
            Int.random(in: 0..<backgroundColorList.count)
        ]
    }
    
}
