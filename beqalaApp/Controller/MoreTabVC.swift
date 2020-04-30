//
//  MoreTabVC.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/22/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class MoreTabVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    @IBAction func profileBtn(_ sender: Any) {
        let profileVc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        present(profileVc, animated: true, completion: nil)
        
    }
    @IBAction func aboutAppBtn(_ sender: Any) {
        let aboutVC = storyboard?.instantiateViewController(withIdentifier: "aboutAppVc") as! AboutAppVC
        present(aboutVC, animated: true, completion: nil)
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "api_token")
        if helper.getApiToken() == nil {
            print("user is logout")
            helper.restartApp()
        }
        
    }
    
}

