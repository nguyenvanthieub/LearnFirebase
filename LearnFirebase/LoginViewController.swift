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
    @IBOutlet weak var updatePasswordStatusLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentSignedinUser()
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
                self.loginStatusLabel.text = error?.localizedDescription//"Login Failure"
            }
        })
        
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        print("forgetPassword")
        let email = "leoski94@gmail.com"
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error: Error?) in
            if let error = error {
                print(error)
                self.loginStatusLabel.text = error.localizedDescription//"Error"
            } else {
                self.loginStatusLabel.text = "Password reset email sent."
            }
        })
    }
    
    @IBAction func updateEmail(_ sender: Any) {
        print("updateEmail")
        let user = FIRAuth.auth()?.currentUser
        user?.updateEmail(emailUpdateTextField.text ?? "", completion: { (error: Error?) in
            if let error = error {
                self.updateEmailStatusLabel.text = error.localizedDescription
            } else {
                self.updateEmailStatusLabel.text = "Email updated."
            }
        })
    }

    @IBAction func updatePassword(_ sender: Any) {
        print("updatePassword")
        let user = FIRAuth.auth()?.currentUser
        user?.updatePassword(passwordUpdateTextField.text ?? "", completion: { (error: Error?) in
            if let error = error {
                self.updatePasswordStatusLabel.text = error.localizedDescription
            } else {
                self.updatePasswordStatusLabel.text = "Password updated."
            }
        })
    }
    
    @IBAction func signOut(_ sender: Any) {
        print("signOut")
        try! FIRAuth.auth()?.signOut()
    }
    
    // Delete Account
    func deleteAcount() {
        let user = FIRAuth.auth()?.currentUser
        user?.delete(completion: { (error: Error?) in
            if let error = error {
                print(error)
            } else {
                print("Account deleted.")
            }
        })
    }
    
    func getCurrentSignedinUser() {
        FIRAuth.auth()?.addStateDidChangeListener({ (auth: FIRAuth, user: FIRUser?) in
            if let _ = user {
                print("User Login")
            } else {
                print("User Logout")
            }
        })
    }
}
