//
//  MagazineDetailViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/29/24.
//

import UIKit
import WebKit
import Kingfisher

class MagazineDetailViewController: UIViewController {
    
    static let id = "MagazineDetailView"
    
    var webView: WKWebView!
    
    // VC 인스턴스 생성시 프로퍼티 값 초기화 위임
    var imageURL: String = ""
    var webURL: String = ""
    var detailTitle: String = ""
    var detailDate: String = ""
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTitleView: UILabel!
    @IBOutlet var detailDateView: UILabel!
    @IBOutlet var viewOnWebButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        detailImageView.kf.setImage(with: URL(string: imageURL));
        detailTitleView.font = .boldSystemFont(ofSize: 24)
        detailDateView.font = .systemFont(ofSize: 14)
        detailDateView.textColor = .darkGray.withAlphaComponent(0.8)
        viewOnWebButton.tintColor = .systemGreen
    }


    @IBAction func onTouchWebViewButton(_ sender: UIButton) {
        webView.load(URLRequest(url: URL(string: webURL)!));
    }
    
}

extension MagazineDetailViewController: WKUIDelegate {
    
    override func loadView() {
        let webConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfig)
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }
    
}
