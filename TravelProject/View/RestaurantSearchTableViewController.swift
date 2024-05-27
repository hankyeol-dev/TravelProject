//
//  RestaurantSearchTableViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantSearchTableViewController: UITableViewController {
    
    @IBOutlet var headerItem: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    let datas = RestaurantList().restaurantArray
    var filteredDatas = RestaurantList().restaurantArray
    var likeArray: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight =  185
        self.tableView.sectionHeaderTopPadding = 0
        self.tableView.tableHeaderView = UIView(frame: CGRect(x:0.0, y:0.0, width: 0.0, height: 0))
        
        self.headerItem.backgroundColor = .systemGreen
        self.tableView.backgroundColor = .systemGreen
        
        likeArray = datas.map {
            el -> Int in
            return 0
        }
        
        self.searchButton.addTarget(self, action: #selector(searchRestaurant), for: .touchUpInside)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDatas.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerItem
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! CustomRestaurantItemViewCell
        
        print(indexPath.row)
        print("2", filteredDatas)
        
        let data = filteredDatas[indexPath.row]
        
        cell.restaurantImage.kf.setImage(with: URL(string: data.image))
        cell.selectionStyle = .none
        cell.restaurantTitle.text = data.name
        cell.restaurantCateogry.text = data.category
        cell.restaurantTel.text = data.phoneNumber
        
        cell.restaurantLikeButton.tag = indexPath.row
        cell.restaurantLikeButton.tintColor = likeArray[indexPath.row] == 0 ? .lightGray.withAlphaComponent(0.8) : .systemPink
        cell.restaurantLikeButton.addTarget(self, action: #selector(touchLikeButton), for: .touchUpInside)
        
        return cell
    }
    
    @objc func touchLikeButton(_ target: UIButton) {
        if likeArray[target.tag] == 0 {
            likeArray[target.tag] = 1
        } else {
            likeArray[target.tag] = 0
        }
        
        self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
    }
    
    @objc func searchRestaurant() {
        guard let search = self.searchTextField.text else {
            return;
        }
        
        if !search.isEmpty {
            filteredDatas = filteredDatas.filter { restaurant -> Bool in
                return (restaurant.name.contains(search) || restaurant.category.contains(search)) ? true : false
                
            }
        }
                
        self.tableView.reloadData()
    }
    
}
