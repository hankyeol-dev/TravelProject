//
//  SearchTravelCityTableViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/29/24.
//

import UIKit
import Kingfisher

class SearchTravelCityTableViewCell: UITableViewCell {
    
    static let id = "SearchTravelCityTableViewCell"

    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var bottomInfoView: UIView!
    @IBOutlet var relatedCityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImage.contentMode = .scaleAspectFill
        cityImage.layer.cornerRadius = 8
        
        cellBackgroundView.layer.cornerRadius = 8
        cellBackgroundView.contentMode = .scaleAspectFill
        cellBackgroundView.backgroundColor = .systemGray.withAlphaComponent(0.4)
        
        cityName.textColor = .white
        cityName.textAlignment = .right
        cityName.font = .boldSystemFont(ofSize: 20)
        
        bottomInfoView.backgroundColor = .black
        bottomInfoView.layer.cornerRadius = 8
        bottomInfoView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
        relatedCityLabel.textColor = .white
        relatedCityLabel.font = .systemFont(ofSize: 14)
    }

    func configureCellWithData(_ data: CityModel) {
        cityImage.kf.setImage(with: URL(string: data.city_image))
        cityName.text = data.formattedCityName
        relatedCityLabel.text = data.city_explain
    }
    
}
