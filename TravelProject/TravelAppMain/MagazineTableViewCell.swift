//
//  MagazineTableViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/28/24.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "MagazineTableViewCell"
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellDescription: UILabel!
    @IBOutlet var cellDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellImage.layer.cornerRadius = 12
        cellImage.contentMode = .scaleAspectFill
        
        cellTitle.titleLabelStyle()
        cellDescription.descriptLabelStyle(size: 15, color: .systemGray3)
        cellDate.descriptLabelStyle(size: 13, color: .systemGray3)
        cellDate.textAlignment = .right
    }
    
    func configureCellWithData(_ data: Magazine) {
        cellImage.kf.setImage(with: URL(string: data.photo_image));
        cellTitle.text = data.title
        cellDescription.text = data.subtitle
        cellDate.text = data.formattedDate // computed property
        
    }
    
}
