//
//  CustomTravelTableItemViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/26/24.
//

import UIKit
import Kingfisher

class CustomTravelTableItemViewCell: UITableViewCell {
    
    
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var itemTitle: UILabel!
    @IBOutlet var itemDescription: UILabel!
    @IBOutlet var itemDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // image style
        itemImage.contentMode = .scaleAspectFill
        itemImage.layer.cornerRadius = 12
        
        // title style
        itemTitle.font = .boldSystemFont(ofSize: 20)
        itemTitle.numberOfLines = 0
        
        // description style
        itemDescription.font = .systemFont(ofSize: 13)
        itemDate.font = .systemFont(ofSize: 13)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
