//
//  MKWebVC.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 3/9/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import WebKit

class MKWebVC: UIViewController {

    @IBOutlet weak var containerView: UIView! = nil
    var webView: WKWebView?
    public var requestUrl:String? = "https://easyiot-cloud.com/"
    
    override func loadView() {
        super.loadView()
        
        self.webView = WKWebView()
        self.view = self.webView!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let requestUrl = requestUrl {
            let url = URL(string:requestUrl)
            let req = URLRequest(url: url!)
            self.webView?.load(req)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
