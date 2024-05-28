//
//  TavelAppMainViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/28/24.
//

import UIKit

class TravelAppMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let datas: [Magazine] = MagazineInfo.magazine
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureDefault(viewTitle: "Main")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: MagazineTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: MagazineTableViewCell.cellIdentifier)
        
        //        mainTableView.rowHeight = UITableView.automaticDimension
        mainTableView.rowHeight = 450
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: datas[indexPath.row].link) {
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainTableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.cellIdentifier, for: indexPath) as! MagazineTableViewCell
        
        // logic here
        cell.configureCellWithData(datas[indexPath.row])
        
        return cell
    }
    
}
