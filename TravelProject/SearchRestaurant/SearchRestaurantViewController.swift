//
//  SearchRestaurantViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/28/24.
//

import UIKit

class SearchRestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    var datas: [Restaurant] = RestaurantList.restaurantArray
    var fav: [Int] = RestaurantList.restaurantArray.map {
        restaurant in return 0
    }
    
    @IBOutlet var restaurantSearchBar: UISearchBar!
    @IBOutlet var restaurantTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureDefault(viewTitle: "레스토랑 검색")
        
        restaurantSearchBar.delegate = self
        restaurantTable.delegate = self
        restaurantTable.dataSource = self
        restaurantTable.register(UINib(nibName: SearchRestaurantTableViewCell.id, bundle: nil), forCellReuseIdentifier: SearchRestaurantTableViewCell.id)
        
        restaurantTable.rowHeight = 140
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = restaurantTable.dequeueReusableCell(withIdentifier: SearchRestaurantTableViewCell.id, for: indexPath) as! SearchRestaurantTableViewCell
        
        cell.cellFavButton.tag = indexPath.row
        cell.cellFavButton.addTarget(self, action: #selector(onTouchFavButton), for: .touchUpInside)
        cell.configureFavButton(fav[indexPath.row])
        
        cell.configureCellWithData(datas[indexPath.row]);
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchedText = self.restaurantSearchBar.text else {
            return;
        }
        
        if searchedText.isEmpty {
            datas = RestaurantList.restaurantArray
        } else {
            datas = RestaurantList.restaurantArray.filter {
                restaurant in
                return restaurant.name.contains(searchedText)
            }
        }
        
        restaurantTable.reloadSections(IndexSet(integer: 0), with: .none);
    }
    
    @objc func onTouchFavButton(_ sender: UIButton) {
        if fav[sender.tag] == 0 {
            fav[sender.tag] = 1
        } else {
            fav[sender.tag] = 0
        }
        restaurantTable.reloadSections(IndexSet(integer: 0), with: .none)
    }
}
