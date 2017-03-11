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
//    public var requestUrl:String? = "https://easyiot-cloud.com/"
    var path = "http://42.119.128.237/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: path)
        let request = URLRequest(url: url!);
        webView.loadRequest(request);
        NSURLConnection(request: request, delegate: self)
    }
    
}

extension WebVC: NSURLConnectionDataDelegate {
    
    func connection(_ connection: NSURLConnection, didReceive challenge: URLAuthenticationChallenge) {
        showAlert()
    }
    
    func showAlert(){
        
        let alertController = UIAlertController(title: "Authentication Required", message: nil, preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Login", style: .default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            var urlComponents = URLComponents(string: self.path)
            urlComponents?.user = firstTextField.text //"admin"
            urlComponents?.password = secondTextField.text//"test"
            let url = urlComponents?.url;
            let request = URLRequest(url: url!);
            self.webView.loadRequest(request);
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Username"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Password"
            textField.isSecureTextEntry = true
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
