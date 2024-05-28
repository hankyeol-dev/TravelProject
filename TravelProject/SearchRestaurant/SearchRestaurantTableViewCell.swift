//
//  SearchRestaurantTableViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/28/24.
//

import UIKit
import Kingfisher

class SearchRestaurantTableViewCell: UITableViewCell {
    
    static let id = "SearchRestaurantTableViewCell"
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellCategory: UILabel!
    @IBOutlet var cellPhoneNumber: UILabel!
    @IBOutlet var cellFavButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.commonSquareImage(radius: 12)
        cellTitle.titleLabelStyle()
        cellCategory.descriptLabelStyle(size: 15, color: .darkGray)
        cellPhoneNumber.descriptLabelStyle(size: 15, color: .darkGray)
    }

    func configureCellWithData(_ data: Restaurant) {
        
        cellTitle.text = data.name
        cellCategory.text = data.category
        cellPhoneNumber.text = data.phoneNumber
        cellImage.kf.setImage(with: URL(string: data.image))
    }
    
    func configureFavButton(_ favState: Int) {
        if favState == 0 {
            cellFavButton.tintColor = .lightGray
        } else {
            cellFavButton.tintColor = .systemPink
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
