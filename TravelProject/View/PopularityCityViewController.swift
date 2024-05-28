//
//  PopularityCityViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/27/24.
//

import UIKit

class PopularityCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var datas: [City] = CityInfo().cityList
    
    @IBOutlet var cityTableSection: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        
        // configure tableView protocol
        cityTableSection.delegate = self
        cityTableSection.dataSource = self
        
        cityTableSection.register(UINib(nibName: "PopularityCityViewCell", bundle: nil), forCellReuseIdentifier: "PopularityCityCell")
        cityTableSection.register(UINib(nibName: "AdvertisementViewCell", bundle: nil), forCellReuseIdentifier: "advertisementCell")
        
        cityTableSection.rowHeight = 140
    }
    
    // configure table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return datas[indexPath.row].ad ? 100 : 140
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = datas[indexPath.row]
        
        let cityCell = cityTableSection.dequeueReusableCell(withIdentifier: "PopularityCityCell", for: indexPath) as! PopularityCityViewCell
        let adCell = cityTableSection.dequeueReusableCell(withIdentifier: "advertisementCell", for: indexPath) as! AdvertisementViewCell
        
        cityCell.likeButton.tag = indexPath.row
        cityCell.likeButton.addTarget(self, action: #selector(onTouchLikeButton), for: .touchUpInside)
        
        cityCell.configureCell(data)
        adCell.configureCell(data)
        
        
        return data.ad ? adCell : cityCell
    }
    
    @objc func onTouchLikeButton(_ sender: UIButton) {
        if let isLiked = datas[sender.tag].like {
            if isLiked {
                datas[sender.tag].like = false
                sender.buttonOnTouch(tintColor: .lightGray)
            } else {
                datas[sender.tag].like = true
                sender.buttonOnTouch(tintColor: .systemPink)
            }
            
            self.cityTableSection.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
        }
        
    }

}
