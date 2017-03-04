//
//  WebviewViewController.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 3/3/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    private var requestUrl:String? = "https://easyiot-cloud.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        if let url = requestUrl {
            if let urlRequest = URL(string: url) {
                webView.loadRequest(URLRequest(url: urlRequest))
            }
        }
    }
    
    func shouldHandleRequest(_ request: URLRequest) -> Bool {
        return true
    }

}

extension WebviewViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return shouldHandleRequest(request)
    }
}
