//
//  SearchTravelCityViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/29/24.
//

import UIKit

class SearchTravelCityViewController: UIViewController {

    @IBOutlet var citySearchBar: UISearchBar!
    @IBOutlet var citySearchSegment: UISegmentedControl!
    @IBOutlet var searchedCityTable: UITableView!
    
    let segmentedControlTitles = ["전체", "한국", "해외"]
    var cellDatas = CityModelInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureDefault(viewTitle: "국가 탐색")
        
        for i in 0...2 {
            citySearchSegment.setTitle(segmentedControlTitles[i], forSegmentAt: i)
        }
        
        searchedCityTable.delegate = self
        searchedCityTable.dataSource = self
        searchedCityTable.register(UINib(nibName: SearchTravelCityTableViewCell.id, bundle: nil), forCellReuseIdentifier: SearchTravelCityTableViewCell.id)
        
        searchedCityTable.rowHeight = 180
        
        citySearchSegment.addTarget(self, action: #selector(selectSegment), for: .valueChanged)
    }
    
    @objc func selectSegment(_ sender:UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            cellDatas = CityModelInfo.city
        } else if sender.selectedSegmentIndex == 1 {
            cellDatas = CityModelInfo.selectedDomestic
        } else {
            cellDatas = CityModelInfo.selectedNoneDomestic
        }
        
        searchedCityTable.reloadSections(IndexSet(integer: 0), with: .none)
    }
}

extension SearchTravelCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchedCityTable.dequeueReusableCell(withIdentifier: SearchTravelCityTableViewCell.id, for: indexPath) as! SearchTravelCityTableViewCell
        
        cell.configureCellWithData(cellDatas[indexPath.row])
        
        return cell
    }
    
    
}
