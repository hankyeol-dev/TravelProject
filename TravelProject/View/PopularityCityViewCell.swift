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
        self.commonInfo.text = self.returnStarRating(grade) + " | " + "저장: \(save.formatted())"
        self.cityImage.kf.setImage(with: URL(string: image))
        self.likeButton.tintColor = like ? .lightGray : .systemPink
        
    }
    
//    func convertGradeIntoStarRating() {
//        let testString = NSMutableAttributedString(string: " ")
//        let testAttached = NSTextAttachment()
//        
////        testAttached.image =
////        testAttached.image!.withTintColor(.red)s★★
//        testAttached.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)
//        testString.append(NSAttributedString(attachment: testAttached))
//        
//        self.commonInfo.attributedText = testString
//    }
    
    func returnStarRating(_ grade: Double) -> String {
        
        if grade > 4.5 {
            return "★★★★★"
        } else if grade > 3.5 {
            return "★★★★"
        } else if grade > 2.5 {
            return "★★★"
        } else if grade > 1.5 {
            return "**"
        } else if grade > 0.5 {
            return "★"
        } else {
            return ""
        }
    }
}
