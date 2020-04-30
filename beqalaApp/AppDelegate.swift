//
//  AppDelegate.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/4/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let api_token = helper.getApiToken() {
            print(api_token)
            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
            window?.rootViewController = tab
        }
        
        return true
    }
}

