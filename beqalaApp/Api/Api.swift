//
//  Api.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/9/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api: NSObject {
    
    class func login(email: String, password: String, completion: @escaping(_ error: Error?, _ success: Bool) ->Void) {
        let url = "https://bqala.panorama-q.com/api/auth/login"
        let params = ["email": email,
                      "password": password,
                      "fcm_token_android": "sdsdsds"
        ]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
            
            .responseJSON { response in
                
                switch response.result {
                case .failure(let error):
                    completion(error, false)
                    print("Error is : \(error)")
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if let api_token = json["data"]["token"].string{
                        print("api_token: \(api_token)")
                        
                        // save api_token to UserDefaults
                        helper.saveApiToken(token: api_token)
                        
                        completion(nil, true)
                    }
                    
                }
                
        }
        
    }
    class func register(name:String, email: String, phone: String, address: String, password: String, completion: @escaping(_ error: Error?, _ success: Bool) ->Void) {
        let url = "https://bqala.panorama-q.com/api/auth/register/user?"
        let params = ["name": name,
                      "email": email,
                      "phone": phone,
                      "address": address,
                      "password": password]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result {
                case .failure(let error):
                    completion(error, false)
                    print("Error is : \(error)")
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if let api_token = json["msg"].string{
                        print("api_token: \(api_token)")
                        
                        // save api_token to UserDefaults
                        helper.saveApiToken(token: api_token)
                        
                        completion(nil, true)
                    }
                }
                
        }
        
    }
}
