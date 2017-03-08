//
//  InputVC.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 3/4/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit

class InputVC: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func onTapClicked(_ sender: Any) {
        inputTextField.endEditing(true)
    }
    
    @IBAction func onGoButtonClicked(_ sender: Any) {
//        let webVC = WebVC()
        let webVC = MKWebVC()
        if let input = inputTextField.text, input.characters.count > 0 {
            webVC.requestUrl = input
        }
        self.navigationController?.pushViewController(webVC, animated: true)
    }
    
}

extension InputVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.endEditing(true)
        return true
    }
}
