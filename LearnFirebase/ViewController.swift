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
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUp(_ sender: Any) {
//        print("Thieu Mao")
//        print("usernameTextField", usernameTextField.text)
//        print("passwordTextField", passwordTextField.text)
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
    
}

