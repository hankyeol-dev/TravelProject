//
//  PopularityCityDetailViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/29/24.
//

import UIKit

class PopularityCityDetailViewController: UIViewController {
    
    static let id: String = "PopularityCityDetailViewController"
    
    var labelText: String = ""
    var isAd: Bool = false
    
    @IBOutlet var pageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageLabel.text = labelText
        
        navigationItem.title = "디테일 페이지"
        navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "arrow.left.circle"), style: .plain, target: self, action: #selector(onTouchGoBackBtn)), animated: false)
    }
    
    
    @objc func onTouchGoBackBtn(_ sender:UIButton) {
        if isAd {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: false)
        }
    }
    
}
