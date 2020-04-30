//
//  Api+SearchProducts.swift
//  beqalaApp
//
//  Created by Alaa Adel on 10/25/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON

extension Api {
    
    class func searchProducts(completion: @escaping (_ error: Error?, _ products: [SearchProducts]?)-> Void) {
        
        let url = "https://bqala.panorama-q.com/api/products/all"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["products"].array else {
                    completion(nil,nil)
                    return
                }
                
                var products = [SearchProducts]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let product = SearchProducts()
                    product.id = data["id"]?.int ?? 0
                    product.name = data["name"]?.string ?? ""
                    product.image = data["image"]?.string ?? ""
                    
                    products.append(product)
                }
                completion(nil,products)
            }
        }
    }
    
}
