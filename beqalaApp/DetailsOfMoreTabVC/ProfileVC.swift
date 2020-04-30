//
//  ProfileVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 11/12/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    
    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UserDefaults.standard.value(forKey: "ImgProfile")
        
        let userName = UserDefaults.standard.value(forKey: "userName")
        let MobileNumber = UserDefaults.standard.value(forKey: "mobileNumber")
        let email = UserDefaults.standard.value(forKey: "email")
        let location = UserDefaults.standard.value(forKey: "location")
        imageProfile.image = img as? UIImage
        
        userNameLabel.text = userName as? String
        mobileNumberLabel.text = MobileNumber as? String
        emailLabel.text = email as? String
        locationLabel.text = location as? String
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editBtn(_ sender: Any) {
        print("EditProfile")
        
        
        
        let editProfileVc = storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        
        present(editProfileVc, animated: true, completion: nil)
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
