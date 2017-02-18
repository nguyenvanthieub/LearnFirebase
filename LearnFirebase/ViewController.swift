//
//  ViewController.swift
//  LearnFirebase
//
//  Created by Nguyen Van Thieu B on 2/14/17.
//  Copyright © 2017 Thieu Mao. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    // Sign Up
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // Get User Profile
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    // Update User Profile
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoUrlTextField: UITextField!
    @IBOutlet weak var updateStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(_ sender: Any) {
        print("signUp")
        FIRAuth.auth()?.createUser(withEmail: usernameTextField.text ?? "thieu", password: passwordTextField.text ?? "123456", completion: { (user, error) in
            if let user = user {
                print(user.displayName)
                print(user.email)
                print(user.photoURL)
                print(user.uid)
                self.errorLabel.text = "Login Successfully"
            } else {
                self.errorLabel.text = "Login failure"
            }
        })
    }
    
    @IBAction func getUserProfile(_ sender: Any) {
        print("getUserProfile")
        if let user = FIRAuth.auth()?.currentUser {
            idLabel.text = user.uid
            emailLabel.text = user.email
            if let name = user.displayName {
                nameLabel.text = name
            }
            if let photoURL = user.photoURL {
                try! avatarImageView.image = UIImage(data: Data(contentsOf: photoURL))
            }
        }
    }
    
    @IBAction func updateUserProfile(_ sender: Any) {
        print("updateUserProfile")
        let user = FIRAuth.auth()?.currentUser
        if let user = user {
            let changeRequest = user.profileChangeRequest()
            changeRequest.displayName = nameTextField.text
            changeRequest.photoURL = URL(string: photoUrlTextField.text ?? "")
            changeRequest.commitChanges(completion: { (error) in
                if let error = error {
                    self.updateStatusLabel.text = "Failure"
                } else {
                    self.updateStatusLabel.text = "Success"
                }
            })
        }
    }
}

