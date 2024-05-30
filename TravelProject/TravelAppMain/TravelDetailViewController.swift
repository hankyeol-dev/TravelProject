//
//  TravelDetailViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/30/24.
//

import UIKit
import Kingfisher
import WebKit

class TravelDetailViewController: UIViewController  {

    static let id = "TravelDetailViewController"
    
    var detailData: [Magazine]?
    
    @IBOutlet var goWebViewButton: UIButton!
    @IBOutlet var detailDate: UILabel!
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detailImage: UIImageView!
    
    @IBOutlet var detailWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
        self.configureWebView()
    }
    
    func configureViewWithData(_ data: Magazine) {
        
        detailData = MagazineInfo.getMagazineById(data.id)

    }
    func configureView() {
        guard let detailData else { return }
        
        detailImage.kf.setImage(with: URL(string: detailData[0].photo_image))
        detailImage.contentMode = .scaleAspectFill
        detailTitle.text = detailData[0].title
        detailTitle.font = .boldSystemFont(ofSize: 24)
        detailTitle.numberOfLines = 2
        detailDate.text = detailData[0].formattedDate
        detailDate.font = .systemFont(ofSize: 15)
        goWebViewButton.addTarget(self, action: #selector(loadWebView), for: .touchUpInside)
    }
    func configureWebView() {
        detailWebView.isHidden = true
        detailWebView.uiDelegate = self
        detailWebView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func loadWebView(_ sender: UIButton) {
        self.openWebView();
    }

}

extension TravelDetailViewController: WKUIDelegate {
    
    func openWebView() {
        guard let data = detailData else { return }
        self.detailWebView.isHidden = false
        self.detailWebView.load(URLRequest(url: URL(string: data[0].link)!))
    }
}
