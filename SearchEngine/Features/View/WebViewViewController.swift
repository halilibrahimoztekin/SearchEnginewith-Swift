//
//  WebViewViewController.swift
//  MovieReviewAppwithSwift
//
//  Created by Halil İbrahim Öztekin on 8.11.2021.
//

import UIKit
import WebKit
class WebViewViewController: UIViewController {

    var webView = WKWebView()
    var url = "https://google.com"
    override func viewDidLoad() {
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        guard let url2 = URL(string: url) else {return}
        webView.load(URLRequest(url: url2))
        self.view.addSubview(webView)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
}
