//
//  PopularityCityViewCell.swift
//  TravelProject
//
//  Created by 강한결 on 5/27/24.
//

import UIKit
import Kingfisher

class PopularityCityViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var descript: UILabel!
    @IBOutlet var commonInfo: UILabel!
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cityImage.commonSquareImage(radius: 4)
        self.title.titleLabelStyle()
        self.descript.descriptLabelStyle(size: 15, color: .darkGray)
    }
    
    func configureCell(_ data: City) {
        guard let description = data.description,
              let image = data.city_image,
              let grade = data.grade,
              let save = data.save,
              let like = data.like
        else {
            return;
        }
        
        self.title.text = data.title
        self.descript.text = description
        self.commonInfo.attributedText = self.convertGradeIntoStarRating(grade, save)
        self.cityImage.kf.setImage(with: URL(string: image))
        self.likeButton.tintColor = like ? .lightGray : .systemPink
        
    }
    
    func convertGradeIntoStarRating(_ grade: Double, _ save: Double) -> NSAttributedString {
        let base = NSMutableAttributedString(string: "")
        let attached = NSTextAttachment()
        let attachedImage = UIImage(systemName: "star.fill")?.withTintColor(.orange)
        
        attached.image = attachedImage
        attached.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)
        
        base.append(NSAttributedString(attachment: attached))
        base.append(NSAttributedString(string: " \(grade) ⋅ \(save.formatted())"))
        
        return base
    }
    
}
