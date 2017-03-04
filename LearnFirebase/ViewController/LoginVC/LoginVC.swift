//
//  LoginVC.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 3/4/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    var email = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = nil
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func onTapClicked(_ sender: Any) {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    @IBAction func loginFirebase(_ sender: Any) {
        print("Login Firebase")
        if checkValid() {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user: FIRUser?, error: Error?) in
                if let user = user {
                    self.resultLabel.text = user.email
                    let inputVC = InputVC()
                    self.navigationController?.pushViewController(inputVC, animated: true)
                } else {
                    self.resultLabel.text = error?.localizedDescription
                }
            })
        }
    }
    
    @IBAction func registerFirebase(_ sender: Any) {
        if checkValid() {
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                if let user = user {
                    self.resultLabel.text = user.email
                } else {
                    self.resultLabel.text = error?.localizedDescription
                }
            })
        }
    }
    
    func checkValid() -> Bool {
        resultLabel.text = nil
        if let e = emailTextField.text, e.characters.count > 0 ,let p = passwordTextField.text, p.characters.count > 0 {
            email = e
            password = p
            return true
        }
        resultLabel.text = "Invalid"
        return false
    }
    
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
}
