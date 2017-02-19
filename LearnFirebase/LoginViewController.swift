//
//  LoginViewController.swift
//  LearnFirebase
//
//  Created by Thieu Mao on 2/19/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // Login & Forget Password
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginStatusLabel: UILabel!
    
    // User Profile
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // Update Email
    @IBOutlet weak var emailUpdateTextField: UITextField!
    @IBOutlet weak var updateEmailStatusLabel: UILabel!
    
    // Update Password
    @IBOutlet weak var passwordUpdateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(_ sender: Any) {
        print("login")
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text ?? "", password: passwordTextField.text ?? "", completion: { (user: FIRUser?, error: Error?) in
            if let user = user {
                self.idLabel.text = user.uid
                self.emailLabel.text = user.email
                self.nameLabel.text = user.displayName ?? "Null"
                if let photoUrl = user.photoURL {
                    try! self.avatarImageView.image = UIImage(data: Data(contentsOf: photoUrl))
                }
                self.loginStatusLabel.text = "Login Success"
            } else {
                self.loginStatusLabel.text = "Login Failure"
            }
        })
        
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        print("forgetPassword")
    }
    
    @IBAction func updateEmail(_ sender: Any) {
        print("updateEmail")
    }

    @IBAction func updatePassword(_ sender: Any) {
        print("updatePassword")
    }
    
    @IBAction func signOut(_ sender: Any) {
        print("signOut")
    }
}
