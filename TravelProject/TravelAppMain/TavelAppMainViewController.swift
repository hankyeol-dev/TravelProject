//
//  TavelAppMainViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/28/24.
//

import UIKit

class TravelAppMainViewController: UIViewController {
    
    let datas: [Magazine] = MagazineInfo.magazine
    
    @IBOutlet var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureDefault(viewTitle: "Main")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UINib(nibName: MagazineTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: MagazineTableViewCell.cellIdentifier)
        
        mainTableView.rowHeight = 450
    }
    
}

extension TravelAppMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.mainTableView.dequeueReusableCell(withIdentifier: MagazineTableViewCell.cellIdentifier, for: indexPath) as! MagazineTableViewCell
        
        cell.configureCellWithData(datas[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = datas[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: TravelDetailViewController.id) as! TravelDetailViewController
        
        // 멤버 프로퍼티 값 할당
        vc.configureViewWithData(data)
        
        // present
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
