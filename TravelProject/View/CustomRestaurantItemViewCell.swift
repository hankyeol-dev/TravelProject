//
//  CustomRestaurantItemViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/26/24.
//

import UIKit

class CustomRestaurantItemViewCell: UITableViewCell {

    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var restaurantTitle: UILabel!
    @IBOutlet var restaurantCateogry: UILabel!
    @IBOutlet var restaurantTel: UILabel!
    @IBOutlet var restaurantLikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.restaurantImage.contentMode = .scaleAspectFill
        self.restaurantImage.layer.cornerRadius = 8
        self.restaurantTitle.font = .boldSystemFont(ofSize: 18)
        self.restaurantCateogry.font = .systemFont(ofSize: 14)
        self.restaurantTel.font = .systemFont(ofSize: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
