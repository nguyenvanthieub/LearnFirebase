//
//  WebVC.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 3/4/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class WebVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    public var requestUrl:String? = "https://easyiot-cloud.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        if let u = requestUrl {
//            var url = u
//            if !url.hasPrefix("http") {
//                url = "http://" + url
//            }
            if let urlRequest = URL(string: u) {
                webView.loadRequest(URLRequest(url: urlRequest))
            }
        }
    }
    
    func shouldHandleRequest(_ request: URLRequest) -> Bool {
        return true
    }
    
}

extension WebVC: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return shouldHandleRequest(request)
    }
}
