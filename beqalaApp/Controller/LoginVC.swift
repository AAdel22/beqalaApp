//
//  ViewController.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/4/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signinButton(_ sender: Any) {
        guard let email = emailTextFeild.text, !email.isEmpty else {return}
        guard let password = passwordTextField.text, !password.isEmpty else {return}
        
        Api.login(email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                print("success")
            }else {
                print("error")
            }
        }
        
    }
}

