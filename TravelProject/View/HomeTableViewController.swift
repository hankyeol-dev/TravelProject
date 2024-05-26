//
//  HomeTableViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/26/24.
//

import UIKit
import Kingfisher

class HomeTableViewController: UITableViewController {
    
    @IBOutlet var header: UIView!
    
    let datas: [Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 460
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionHeaderHeight = 80
        tableView.backgroundColor = .systemGreen
    
        tableView.tableHeaderView = UIView(frame: CGRect(x:0.0, y:0.0, width: 0.0, height: 0))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cell touch action
        if let url = URL(string: datas[indexPath.row].link) {
            UIApplication.shared.open(url)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "TravelItemCell", for: indexPath) as! CustomTravelTableItemViewCell
        
        cell.itemImage.kf.setImage(with: URL(string: datas[indexPath.row].photo_image))
        cell.itemTitle.text = datas[indexPath.row].title
        cell.itemDescription.text = datas[indexPath.row].subtitle
        cell.itemDate.text = self.formatDate(datas[indexPath.row].date)
        
        return cell
    }
    
    func formatDate(_ dateString: String) -> String {
        var dateArray = Array(dateString)
        dateArray.insert(contentsOf: "년 ", at: 2)
        dateArray.insert(contentsOf: "월 ", at: 6)
        dateArray.insert(contentsOf: "일", at: dateArray.count)
        
        return String(dateArray)
    }
}
