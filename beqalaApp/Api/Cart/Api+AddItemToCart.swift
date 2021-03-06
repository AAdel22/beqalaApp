//
//  Api+AddItemToCart.swift
//  beqalaApp
//
//  Created by Alaa Adel on 11/9/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Api {
    
    class func addItemToCart(quantity: Int,message: String,mainCategoryId: Int, completion: @escaping(_ error: Error?, _ success: Bool) ->Void) {
        let url = "https://bqala.panorama-q.com/api/products/add-to-favorite"
        let params = ["quantity": quantity,
                      "message": message,
                      "main_category_id": mainCategoryId ] as [String : Any]
        let api_token = helper.getApiToken()!
        let headers : HTTPHeaders = ["Authorization": "Bearer \(api_token)"]
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: headers)
            
            .responseJSON { response in
                
                switch response.result {
                case .failure(let error):
                    completion(error, false)
                    print("Error is : \(error)")
                case .success(let value):
                    print(value)
                    let json = JSON(value)
                    print(json)
                    print(api_token)
                    if let data = json["data"].string{
                        print("data: \(data)")
                    }
                    completion(nil, true)
                    
                }
                
        }
        
    }
}
