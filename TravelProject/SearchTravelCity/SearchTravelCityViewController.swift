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
    var segmentedControlState = 0
    
    var cellDatas = CityModelInfo.city
    var searchedData: [CityModel] = CityModelInfo.city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureDefault(viewTitle: "국가 탐색")
        
        for i in 0...2 {
            citySearchSegment.setTitle(segmentedControlTitles[i], forSegmentAt: i)
        }
        
        self.configureTable()
        self.configureSegmentedControl()
        self.configureSearchBar()
        
    }
    
    func configureTable() {
        searchedCityTable.delegate = self
        searchedCityTable.dataSource = self
        searchedCityTable.register(UINib(nibName: SearchTravelCityTableViewCell.id, bundle: nil), forCellReuseIdentifier: SearchTravelCityTableViewCell.id)
        searchedCityTable.rowHeight = 180
    }
    func configureSegmentedControl() {
        citySearchSegment.addTarget(self, action: #selector(selectSegment), for: .valueChanged)
    }
    func configureSearchBar() {
        citySearchBar.delegate = self
    }
    
    @objc func selectSegment(_ sender:UISegmentedControl) {
        searchedData = mappingDataArrayBySegmentState(sender.selectedSegmentIndex)
        segmentedControlState = sender.selectedSegmentIndex
        searchedCityTable.reloadSections(IndexSet(integer: 0), with: .none)
    }
    
    func mappingDataArrayBySegmentState(_ segmentedControlState: Int) -> [CityModel] {
        return segmentedControlState == 0 ? cellDatas : segmentedControlState == 1 ? CityModelInfo.selectedDomestic : CityModelInfo.selectedNoneDomestic
    }
}

extension SearchTravelCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchedCityTable.dequeueReusableCell(withIdentifier: SearchTravelCityTableViewCell.id, for: indexPath) as! SearchTravelCityTableViewCell
        
        cell.configureCellWithData(searchedData[indexPath.row])
        
        return cell
    }
    
    
}

extension SearchTravelCityViewController: UISearchBarDelegate {
    // 1. 일단은 입력 + 검색 이 일어났을 때
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        citySearchBar.resignFirstResponder()
        
        guard let searchedCity = searchBar.text?.lowercased() else { return }
        
        if searchedCity.isEmpty {
            searchedData = mappingDataArrayBySegmentState(segmentedControlState)
        } else {
            searchedData = filteringData(searchedCity.lowercased())
        }
        
        searchedCityTable.reloadSections(IndexSet(integer: 0), with: .none)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchedCity = searchBar.text?.lowercased() else { return }
        
        if searchedCity.isEmpty {
            searchedData = mappingDataArrayBySegmentState(segmentedControlState)
        } else {
            searchedData = filteringData(searchedCity.lowercased())
        }
        
        searchedCityTable.reloadSections(IndexSet(integer: 0), with: .none)
    }
    

    // 데이터에서 키워드 필터링하기
    func filteringData(_ searchText: String) -> [CityModel] {
        return mappingDataArray(mappingDataArrayBySegmentState(segmentedControlState), searchText: searchText)
    }
    
    func mappingDataArray(_ dataArray: [CityModel], searchText: String) -> [CityModel] {
        return _filter(dataArray, cb: {
            $0.city_name.contains(searchText) || $0.city_explain.contains(searchText) || $0.city_english_name.lowercased().contains(searchText)
        })
        
    }
    
}
