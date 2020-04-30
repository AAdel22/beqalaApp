//
//  Api+MainCategories.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/12/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension Api {
    
    class func mainCategories(completion: @escaping (_ error: Error?, _ categories: [MainCategories]?)-> Void) {
        
        let url = "https://bqala.panorama-q.com/api/main-categories"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            switch response.result {
            case .failure(let error):
                completion(error, nil)
                print(error)
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataArr = json["data"]["main_categories"].array else {
                    completion(nil,nil)
                    return
                }
                
                var categories = [MainCategories]()
                for data in dataArr {
                    guard let data = data.dictionary else {return}
                    let categorie = MainCategories()
                    categorie.id = data["id"]?.int ?? 0
                    categorie.name = data["name"]?.string ?? ""
                    categorie.image = data["image"]?.string ?? ""
                    
                    categories.append(categorie)
                }
                completion(nil,categories)
            }
        }
    }
}
