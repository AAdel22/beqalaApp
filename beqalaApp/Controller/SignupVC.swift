//
//  SignupVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/4/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var mobileTxt: UITextField!
    @IBOutlet weak var locationTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordReTxt: UITextField!
    @IBOutlet weak var checkBox: CheckBox!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        let userName = userNameTxt.text?.trimmed
        let mobileNumber = mobileTxt.text?.trimmed
        let location = locationTxt.text?.trimmed
        let email = emailTxt.text?.trimmed
        let password = passwordTxt.text
        let passwordRe = passwordReTxt.text
        let checkBox = self.checkBox
        
        guard userName?.isEmpty != true else {
            print("UserName is requred!")
            return
        }
        guard mobileNumber?.isEmpty != true else {
            print("MobileNumber is requred!")
            return
        }
        guard location?.isEmpty != true else {
            print("Location is requred!")
            return
        }
        guard email?.isEmpty != true else {
            print("Email is requred!")
            return
        }
        guard password?.isEmpty != true else {
            print("Password is requred!")
            return
        }
        guard password == passwordRe else {
            print("check your password!")
            return
        }
        
        guard checkBox?.ischecked != false else {
            print("plese agree of rules")
            return
        }
        
        // Save Data Profile
        
        UserDefaults.standard.setValue(userName, forKey: "userName")
        UserDefaults.standard.setValue(mobileNumber, forKey: "mobileNumber")
        UserDefaults.standard.setValue(email, forKey: "email")
        UserDefaults.standard.setValue(location, forKey: "location")
        
        Api.register(name: userName!, email: email!, phone: mobileNumber!, address: location!, password: password!) { (error: Error?, success: Bool) in
            if success {
                print("Success")
                
            }
        }
    }
}
